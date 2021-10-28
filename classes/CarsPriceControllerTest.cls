@isTest
public class CarsPriceControllerTest {

    public static final String carName = 'Niva';
    public static final String carType = 'Legend';
    public static final String carPackage = 'Comfort';

    @isTest
    public static void testGetCarsFromParams() {
        TestCarsPriceControllerFactory.setProperties(carName, carType, carPackage);
        TestCarsPriceControllerFactory.createProduct();
        List<Product2> carsFromParams = CarsPriceController.getCarsFromParams(TestCarsPriceControllerFactory.carName, 
            TestCarsPriceControllerFactory.carType);

        System.assertEquals(carsFromParams.size(), 1);
    }

    @isTest
    public static void testGetCarsPrices() {
        TestCarsPriceControllerFactory.setProperties(carName, carType, carPackage);

        Product2 product = TestCarsPriceControllerFactory.createProduct();
        TestCarsPriceControllerFactory.createPricebookEntry(product);
        
        List<Product2> products = new List<Product2>();
        products.add(product);

        List<Product2> carsPrices = CarsPriceController.getCarsPrices(products);

        System.assertEquals(carsPrices.size(), 1);
    }

    @isTest
    public static void testGetParams() {
        TestCarsPriceControllerFactory.setProperties(carName, carType, carPackage);
        Test.startTest();
        PageReference page = TestCarsPriceControllerFactory.setParams();
        Test.setCurrentPage(page);
        Test.stopTest();

        System.assertEquals(CarsPriceController.getParams().size(), 2);
        System.assert(CarsPriceController.getParams().containsKey('carName'));
        System.assert(CarsPriceController.getParams().containsKey('carType'));

        System.assertEquals(CarsPriceController.getParams().get('carName'), carName);
        System.assertEquals(CarsPriceController.getParams().get('carType'), carType);
    }
}
