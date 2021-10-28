public with sharing class CarsPriceControllerFactory {
    public static Product2 createProduct(String carName, String carType) {
        Product2 product = new Product2(Name=carName, Type__c=carType);
        Database.insert(product, false);

        return product;
 }
}