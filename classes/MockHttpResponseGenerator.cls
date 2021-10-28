@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {

    global HttpResponse respond(HTTPRequest request) {
        System.assertEquals(CurrenciesCallouts.ENDPOINT, request.getEndpoint());
        System.assertEquals('GET', request.getMethod());

        HTTPResponse response = new HttpResponse();

        response.setHeader('Content-Type', 'application/json');
        response.setBody('{ "example": "test" }');
        response.setStatusCode(200);

        return response;
    }
}