public with sharing class CenterController {

    public static final String surveyAfterBuying = 'Survey After Buying';

    public static List<Messaging.sendEmailResult> emailResult { get; set; }

    @AuraEnabled(Cacheable=true)
    public static List<Center__c> getCenters() {
        return [
                SELECT Id, 
                Name, 
                City__c, 
                Street__c, 
                State__c,
                Country__c, 
                Postal_Code__c
                FROM Center__c
                ORDER BY CreatedDate
                LIMIT 20
               ];
    }

    @AuraEnabled(Cacheable=true)
    public static List<Product2> getCars() {
        return [
                SELECT Name, 
                Type__c, 
                Image_Link__c, 
                Package__c
                FROM Product2
                ORDER BY Name
                LIMIT 20
               ];
    }

    @AuraEnabled
    public static void sendEmail(String contactName, String contactEmail) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        Id contactId = [
                        SELECT Id, 
                        LastName,
                        Email
                        FROM Contact
                        WHERE LastName =: contactName
                        AND Email =: contactEmail
                        LIMIT 1
                       ].Id;
        EmailTemplate emailTemplate = [
                                       SELECT Id, 
                                       Subject,
                                       Body 
                                       FROM EmailTemplate 
                                       WHERE Name =: surveyAfterBuying
                                      ];               
        message.setTargetObjectId(contactId); 
        message.setUseSignature(false); 
        message.setBccSender(false); 
        message.setSaveAsActivity(false); 
        message.setTemplateID(emailTemplate.Id);
        message.toAddresses = new String[] { contactEmail };
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> { message };
        Messaging.sendEmail(messages);

        emailResult = Messaging.sendEmail(messages);
    }

    @AuraEnabled(Cacheable=true)
    public static Map<String, String> setParams(String carName, String carType) {
        PageReference pdfPage = Page.PDFPricePage;
        pdfpage.setRedirect(true);
        pdfPage.getParameters().put('carName', carName);
        pdfPage.getParameters().put('carType', carType);
        return pdfPage.getParameters();
    }
}