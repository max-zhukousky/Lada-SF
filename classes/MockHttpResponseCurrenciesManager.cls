@isTest
global class MockHttpResponseCurrenciesManager implements HttpCalloutMock {

    global HttpResponse respond(HTTPRequest request) {
        String endpoint = 'https://empathetic-badger-3pcadq-dev-ed.my.salesforce.com/services/data/v53.0/sobjects/CurrencyType/';
        System.assertEquals(endpoint, request.getEndpoint());
        System.assertEquals('POST', request.getMethod());

        HTTPResponse response = new HttpResponse();

        response.setHeader('Content-Type', 'application/json');
        response.setBody('{ "example": "test" }');
        response.setStatusCode(201);

        return response;
    }
}