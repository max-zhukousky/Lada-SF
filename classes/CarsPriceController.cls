public class CarsPriceController {
    public static List<Product2> carsFromParams { get; set; }
    public static List<Product2> carsPrices { get; set; }
    public static List<Id> idsOfCars { get; set; }
    public static Map<String, String> params { get; set; }

    public CarsPriceController() {
        getParams();
       
        carsFromParams = getCarsFromParams(params.get('carName'), params.get('carType'));
        getCarsPrices(carsFromParams); 
    }

    public static Map<String, String> getParams() {
        params = ApexPages.currentPage().getParameters();

        return params;
    }

    public static List<Product2> getCarsFromParams(String carName, String carType) {
        if (String.isBlank(carName) || String.isBlank(carType)) {
            return null;
        }

        carsFromParams = [
                          SELECT Id, 
                          Name, 
                          Type__c
                          FROM Product2 
                          WHERE Name =: carName
                          AND Type__c =: carType
                         ];

        return carsFromParams;
    }

    public static List<Product2> getCarsPrices(List<Product2> carsFromParams) {
        if (carsFromParams.isEmpty()) {
            return null;
        }

        idsOfCars = new List<Id>();

        for (Integer i = 0; i < carsFromParams.size(); i++) {
            idsOfCars.add(carsFromParams[i].Id);
        }

        carsPrices = [
                      SELECT Id, 
                      Package__c, 
                      (SELECT UnitPrice 
                      FROM PriceBookEntries) 
                      FROM Product2 
                      WHERE Id IN: idsOfCars
                     ];

        return carsPrices;
    }
}