@isTest
public class CenterControllerTest {
    
    public static final String centerName = 'Lada Minsk';
    public static final String centerCity = 'Minsk';
    public static final String centerCountry = 'Belarus';
    public static final String centerPostalCode = '220040';
    public static final String centerStreet = 'Dzerzhinskogo St.';
    public static final String centerState = 'No';

    public static final String centerInvalidState = 'WASH';

    public static final String carName = 'Niva';
    public static final String carType = 'Legend';
    public static final String carPackage = 'Comfort';

    public static final String contactLastName = 'Smith';
    public static final String contactEmail = 'willsmith@gmail.com';

    public static final String contactInvalidEmail = 'willsmith';

    public static final String emailTemplateName = 'Big_Sale';
    public static final String emailTemplateDeveloperName = 'Big_Sale_Guys';
    public static final String emailTemplateType = 'custom';
    public static final String emailTemplateSubject = 'Do not miss this!';
    public static final String emailTemplateBody = 'Biggest sales ever';

    @isTest
    public static void testGetCenters() {
        TestCenterControllerFactory.setPropertiesCenter(centerName, centerCity, centerCountry, 
            centerPostalCode, centerStreet, centerState);
        Center__c center = TestCenterControllerFactory.createCenter();

        List<Center__c> centers = CenterController.getCenters();

        System.assertEquals(centers.isEmpty(), false);
        System.assertEquals(centers.size(), 1);
    }

    @isTest
    public static void testGetCentersInvalidState() {
        TestCenterControllerFactory.setPropertiesCenter(centerName, centerCity, centerCountry, 
            centerPostalCode, centerStreet, centerInvalidState);

        try {
            Center__c center = TestCenterControllerFactory.createCenter();
            System.assert(false, 'Exception expected');
        } catch (DMLException ex) {
            System.debug(ex);
        }
    }

    @isTest
    public static void testGetCars() {
        TestCenterControllerFactory.setPropertiesCar(carName, carType, carPackage);
        Product2 car = TestCenterControllerFactory.createCar();

        List<Product2> cars = CenterController.getCars();

        System.assertEquals(cars.isEmpty(), false);
        System.assertEquals(cars.size(), 1);
    }

    @isTest
    public static void testGetCarsNoName() {
        TestCenterControllerFactory.setPropertiesCar('', carType, carPackage);
       
        try {
            Product2 car = TestCenterControllerFactory.createCar();
            System.assert(false, 'Exception expected');
        } catch (DMLException ex) {
            System.debug(ex);
        }
    }

    @isTest
    public static void testSetParams() {
        TestCenterControllerFactory.setPropertiesCar(carName, carType, carPackage);
        Map<String, String> params = CenterController.setParams(carName, carType);

        System.assertEquals(params.isEmpty(), false);
        System.assertEquals(params.size(), 2);
    }

    @isTest
    public static void testSendEmail() {
        TestCenterControllerFactory.setPropertiesContact(contactLastName, contactEmail);

        TestCenterControllerFactory.setPropertiesEmailTemplate(emailTemplateName, emailTemplateDeveloperName, 
            emailTemplateSubject, emailTemplateBody, emailTemplateType);

        User thisUser = [SELECT Id FROM User WHERE Id =: UserInfo.getUserId()];

        System.runAs(thisUser) {
            TestCenterControllerFactory.createContact();
            TestCenterControllerFactory.createEmailTemplate();
        }
        
        CenterController.sendEmail(TestCenterControllerFactory.contactLastName, 
            TestCenterControllerFactory.contactEmail);
        List<Messaging.sendEmailResult> emailResult = CenterController.emailResult;

        System.assertEquals(emailResult.get(0).isSuccess(), true);
    }

    @isTest
    public static void testSendEmailInvalidEmail() {
        TestCenterControllerFactory.setPropertiesContact(contactLastName, contactInvalidEmail);
        
        try {
            TestCenterControllerFactory.createContact();
            System.assert(false, 'Exception expected');
        } catch (DMLException ex) {
            System.debug(ex);
        }
    }
}