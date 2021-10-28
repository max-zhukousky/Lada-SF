({
    handleSuccess : function(component, event, helper) {
        let name = component.find("fieldName").get("v.value");
        let email = component.find("fieldEmail").get("v.value");

        if (name && email) {
            component.find('notifLib').showToast({
                "variant": "success",
                "title": "Your question was sent!"
            });
        }
        else {
            component.find('notifLib').showToast({
                "variant": "error",
                "title": "Your question WAS NOT sent!"
            });
        }
    },

    handleReset : function(component) {
        component.find('fieldName').reset();
        component.find('fieldEmail').reset();
        component.find('field').forEach((f) => f.reset());
    }
})