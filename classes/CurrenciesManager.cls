public with sharing class CurrenciesManager {
    private static final String ENDPOINT = '/services/data/v53.0/sobjects/CurrencyType/';

    public static List<CurrencyType> getCurrencies() {
        List<CurrencyType> currencies = [
                                         SELECT IsoCode, 
                                         ConversionRate
                                         FROM CurrencyType
                                        ];
        return currencies;
    }

    public static List<HttpResponse> updateRates(Map<String, Decimal> abbrToRate) {
        Http http = new Http(); 
        HttpRequest request = new HttpRequest(); 
        request.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + ENDPOINT); 
        request.setMethod('POST'); 
        request.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId()); 
        request.setHeader('Content-Type', 'application/json'); 

        List<RequestBody> requestBodies = new List<RequestBody>();
        List<HttpResponse> responses = new List<HttpResponse>();

        for (String key : abbrToRate.keySet()) {
            requestBodies.add(new RequestBody(key, abbrToRate.get(key)));
        }

        for (Integer i = 0; i < abbrToRate.keySet().size(); i++) {
            request.setBody(JSON.serialize(requestBodies[i])); 
            HttpResponse response = http.send(request);

            if (response.getStatusCode() != 201) {
                System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
                responses.add(response);
            }
        }

        return responses;
    }  
}