public with sharing class RequestBody {
    public String IsoCode;
    public Decimal ConversionRate;
    public Boolean IsActive;
    public Integer DecimalPlaces;

    public RequestBody(String isoCode, Decimal conversionRate) {
        this.IsoCode = isoCode;
        this.ConversionRate = conversionRate;
        this.IsActive = true;
        this.DecimalPlaces = 4;
    }
}