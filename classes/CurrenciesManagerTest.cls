@isTest
public class CurrenciesManagerTest {
    
    @isTest
    public static void testUpdateRates() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseCurrenciesManager());

        Test.startTest();
        
        Map<String, Decimal> abbrToRate = new Map<String, Decimal>();
        abbrToRate.put('USD', 0.5);

        List<HttpResponse> responses = CurrenciesManager.updateRates(abbrToRate);
        HttpResponse response = responses[0];

        Test.stopTest();

        System.debug(response);
        
        System.assert(response.getHeader('Content-Type') == 'application/json');
        System.assertEquals(response.getBody(), '{ "example": "test" }');
        System.assertEquals(201, response.getStatusCode());
    }
}
