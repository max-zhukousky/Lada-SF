({
    handleSuccess : function(component, event, helper) {
        let name = component.find("fieldName").get("v.value");
        let email = component.find("fieldEmail").get("v.value");
        let car = component.find("fieldCar").get("v.value");

        if (name && email && car) {
            component.find('notifLib').showToast({
                "variant": "success",
                "title": "Test drive was booked!"
            });
        }
        else {
            component.find('notifLib').showToast({
                "variant": "error",
                "title": "Test drive WAS NOT booked!"
            });
        }
    },

    handleReset : function(component) {
        component.find('fieldName').reset();
        component.find('fieldEmail').reset();
        component.find('fieldCar').reset();
        component.find('field').forEach((f) => f.reset());
    }
})