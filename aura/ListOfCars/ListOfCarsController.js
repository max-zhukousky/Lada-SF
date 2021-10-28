({
    loadCars : function(component, event, helper) {
        let action = component.get("c.getCars");
        $A.enqueueAction(action);
        action.setCallback(this, function(response) {
            component.set("v.carsList", response.getReturnValue());
        });
    },
    
    handleCarClick : function(component, event) {
        let car = event.getSource().get('v.value');
        component.set("v.carName", car.Name);
        component.set("v.carType", car.Type__c);
        component.set("v.carImage", car.Image_Link__c);
        component.set("v.carPackage", car.Package__c);
        component.set('v.showModalWindow', true);
    },

    handleCancel: function(component) {
        component.set('v.showModalWindow', false);
    },
})