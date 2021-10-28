public class CurrenciesCallouts {
    public static final String ENDPOINT = 'https://www.nbrb.by/api/exrates/rates?periodicity=0';
    private static final String ABBREVIATION = 'Cur_Abbreviation';
    private static final String RATE = 'Cur_OfficialRate';

    public static HttpResponse response { get; set; }
    
    @future(callout=true)
    public static void makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ENDPOINT);
        request.setMethod('GET');
        response = http.send(request);

        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            // List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());

            CurrenciesManager.updateRates(proccessResponse(results));
        }
    }

    private static Map<String, Decimal> proccessResponse(Map<String, Object> results) {
        List<CurrencyType> currencies = CurrenciesManager.getCurrencies();
        Map<String, Double> isoCodeToConversionRateMap = new Map<String, Double>();
        Map<String, Decimal> abbreviationToRateMap = new Map<String, Decimal>();

        for (CurrencyType cur : currencies) {
            isoCodeToConversionRateMap.put(cur.IsoCode, cur.ConversionRate);
        }

        for (Object key : results.keySet()) {
            // Map<String, Object> currenciesMap = (Map<String, Object>)obj;
            String abbreviation = (String)results.get(ABBREVIATION);
            Decimal rate = (Decimal)results.get(RATE);
            if (isoCodeToConversionRateMap.containsKey(abbreviation) && rate > 0) {
                abbreviationToRateMap.put(abbreviation, 1 / rate);
            } 
        }

        return abbreviationToRateMap;
    }
}