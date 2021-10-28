public class TestCenterControllerFactory {
    
    public static String centerName { 
        get { return centerName; } 
        set { centerName = value; }
    } 

    public static String centerCity { 
        get { return centerCity; } 
        set { centerCity = value; }
    }

    public static String centerStreet  { 
        get { return centerStreet; } 
        set { centerStreet = value; }
    }

    public static String centerState  { 
        get { return centerState; } 
        set { centerState = value; }
    }

    public static String centerCountry  { 
        get { return centerCountry; } 
        set { centerCountry = value; }
    }

    public static String centerPostalCode  { 
        get { return centerPostalCode; } 
        set { centerPostalCode = value; }
    }

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

    public static String contactLastName { 
        get { return contactLastName; } 
        set { contactLastName = value; }
    } 

    public static String contactEmail { 
        get { return contactEmail; } 
        set { contactEmail = value; }
    } 

    public static String emailTemplateName { 
        get { return emailTemplateName; } 
        set { emailTemplateName = value; }
    } 

    public static String emailTemplateDeveloperName { 
        get { return emailTemplateDeveloperName; } 
        set { emailTemplateDeveloperName = value; }
    } 

    public static String emailTemplateFolder { 
        get { return emailTemplateFolder; } 
        set { emailTemplateFolder = value; }
    } 

    public static String emailTemplateType { 
        get { return emailTemplateType; } 
        set { emailTemplateType = value; }
    } 

    public static String emailTemplateSubject { 
        get { return emailTemplateSubject; } 
        set { emailTemplateSubject = value; }
    } 

    public static String emailTemplateBody { 
        get { return emailTemplateBody; } 
        set { emailTemplateBody = value; }
    } 

    public static Center__c createCenter() {
        Center__c center = new Center__c(Name=centerName,
                                         City__c=centerCity,
                                         Street__c=centerStreet,
                                         Country__c=centerCountry,
                                         Postal_Code__c=centerPostalCode,
                                         State__c=centerState);
        Database.insert(center);

        return center;
    }

    public static Product2 createCar() {
        Product2 car = new Product2(Name=carName, 
                                    Type__c=carType, 
                                    Package__c=carPackage);
        Database.insert(car);

        return car;
    }

    public static Contact createContact() {
        Contact contact = new Contact(LastName=contactLastName,
                                      Email=contactEmail);
        Database.insert(contact);

        return contact;
    }

    public static EmailTemplate createEmailTemplate() {
        EmailTemplate template = new EmailTemplate(Name=emailTemplateName,
                                                   DeveloperName=emailTemplateDeveloperName,
                                                   Subject=emailTemplateSubject,
                                                   Body=emailTemplateBody,
                                                   FolderId = UserInfo.getUserId(),
                                                   TemplateType=emailTemplateType);
        Database.insert(template);

        return template;
    }

    public static void setPropertiesCenter(String centerName, String centerCity, String centerCountry, 
        String centerPostalCode, String centerStreet, String centerState) {
        TestCenterControllerFactory.centerName = centerName;
        TestCenterControllerFactory.centerCity = centerCity;
        TestCenterControllerFactory.centerCountry = centerCountry;
        TestCenterControllerFactory.centerPostalCode = centerPostalCode;
        TestCenterControllerFactory.centerStreet = centerStreet;
        TestCenterControllerFactory.centerState = centerState;
    }

    public static void setPropertiesCar(String carName, String carType, String carPackage) {
        TestCenterControllerFactory.carName = carName;
        TestCenterControllerFactory.carType = carType;
        TestCenterControllerFactory.carPackage = carPackage;
    }

    public static void setPropertiesContact(String contactLastName, String contactEmail) {
        TestCenterControllerFactory.contactLastName = contactLastName;
        TestCenterControllerFactory.contactEmail = contactEmail;
    }

    public static void setPropertiesEmailTemplate(String emailTemplateName, 
        String emailTemplateDeveloperName, String emailTemplateSubject, String emailTemplateBody,
        String emailTemplateType) {
        TestCenterControllerFactory.emailTemplateName = emailTemplateName;
        TestCenterControllerFactory.emailTemplateDeveloperName = emailTemplateDeveloperName;
        TestCenterControllerFactory.emailTemplateSubject = emailTemplateSubject;
        TestCenterControllerFactory.emailTemplateBody = emailTemplateBody;
        TestCenterControllerFactory.emailTemplateType = emailTemplateType;
    }
}