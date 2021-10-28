({
    generatePDFButton : function(component, event, helper) {
        let action = component.get("c.setParams");

        action.setParams({
            carName: component.get("v.carName"),
            carType: component.get("v.carType"),
            carPackage: component.get("v.carPackage")
        });

        action.setCallback(this, function(response) {
            let vfPricePage = '/apex/PDFPricePage?carName=' + response.getReturnValue().carName + 
                '&' + 'carType=' + response.getReturnValue().carType;
            window.open(vfPricePage);
        }); 
        
        $A.enqueueAction(action);  
    },

    buyACar : function(component, event, helper) {

        let buyACarPage = 'https://ladas-dealership-developer-edition.ap24.force.com/s/buy-a-car?carName=' +
            component.get("v.carName") + '&' + 'carType=' + component.get("v.carType") +
            '&' + 'carPackage=' + component.get("v.carPackage");
        window.open(buyACarPage);
    }
});