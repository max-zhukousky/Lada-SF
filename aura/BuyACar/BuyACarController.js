({
    handleSuccess : function(component, event, helper) {
        let lastName = component.find("fieldLastName").get("v.value");
        let email = component.find("fieldEmail").get("v.value");

        let action = component.get("c.sendEmail");

        action.setParams({
            "contactName": lastName,
            "contactEmail": email
        });;

        action.setCallback(this, function(response) {
            if (lastName && email) {
                component.find('notifLib').showToast({
                    "variant": "success",
                    "title": "Thank you! We will contact you immediately"
                });
            }
            else {
                component.find('notifLib').showToast({
                    "variant": "error",
                    "title": "Something went wrong!"
                });
            }

            console.log(response.getReturnValue());
            console.log(response.getState());
            console.log(response.getError());
        });
        
        $A.enqueueAction(action);
    },

    handleReset : function(component) {
        component.find('fieldName').reset();
        component.find('fieldEmail').reset();
        component.find('field').forEach((f) => f.reset());
    }
})