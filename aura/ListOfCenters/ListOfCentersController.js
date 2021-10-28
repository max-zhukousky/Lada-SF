({
    doInit : function(component, event, helper) {
        let action = component.get("c.getCenters");
       
        action.setCallback(this, function(response) {
            component.set("v.centersList", response.getReturnValue());
        });
        
        $A.enqueueAction(action);     
    }
})