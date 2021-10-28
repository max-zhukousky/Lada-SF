public class TestCarsPriceControllerFactory {

    public static String carName { 
        get { return carName; } 
        set { carName = value; }
    } 

    public static String carType { 
        get { return carType; } 
        set { carType = value; }
    }

    public static String carPackage { 
        get { return carPackage; } 
        set { carPackage = value; }
    }

    public static Product2 createProduct() {
        Product2 product = new Product2(Name=carName, 
                                        Type__c=carType, 
                                        Package__c=carPackage);
        Database.insert(product, false);

        return product;
    }

    public static PricebookEntry createPricebookEntry(Product2 product) {
        Pricebook2 standardPriceBook = new Pricebook2(Id=Test.getStandardPriceBookId(), IsActive=true);
        Database.update(standardPriceBook, false);

        PricebookEntry priceBookEntry = new PricebookEntry(Product2Id=product.Id,
                                                           Pricebook2Id=standardPriceBook.Id,
                                                           UnitPrice=100,
                                                           IsActive=true);
        Database.insert(priceBookEntry);

        return priceBookEntry;
    } 

    public static PageReference setParams() {
        PageReference page = Page.PDFPricePage;
        page.getParameters().put('carName', carName);
        page.getParameters().put('carType', carType);

        return page;
    }

    public static void setProperties(String carName, String carType, String carPackage) {
        TestCarsPriceControllerFactory.carName = carName;
        TestCarsPriceControllerFactory.carType = carType;
        TestCarsPriceControllerFactory.carPackage = carPackage;
    }
}