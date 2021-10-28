@isTest
public class CurrenciesCalloutsTest {
    @isTest
    public static void testMakeGetCallout() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());

        Test.startTest();
        CurrenciesCallouts.makeGetCallout();
        Test.stopTest();

        HttpResponse response = CurrenciesCallouts.response;

        System.debug(response);
        
        System.assert(response.getHeader('Content-Type') == 'application/json');
        System.assertEquals(response.getBody(), '{ "example": "test" }');
        System.assertEquals(200, response.getStatusCode());
    }
}