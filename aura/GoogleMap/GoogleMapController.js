({
    init: function (cmp, event, helper) {
        let action = cmp.get("c.getCenters"); 
        let locations = [];

        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            for (let i = 0; i < response.getReturnValue().length; i++) {
                locations.push({              
                    location: {
                        Street: response.getReturnValue()[i].Street__c,
                        City: response.getReturnValue()[i].City__c,
                        PostalCode: response.getReturnValue()[i].Postal_Code__c,
                        State: response.getReturnValue()[i].State__c,
                        Country: response.getReturnValue()[i].Country__c
                    },         
                    icon: 'utility:layout',
                    title: response.getReturnValue()[i].Name
                });
                 
            }
            cmp.set('v.mapMarkers', locations);
            
        });
        $A.enqueueAction(action);

        cmp.set('v.zoomLevel', 2);
        cmp.set('v.markersTitle', 'Lada Dealership And Service Centers Locations');
        cmp.set('v.showFooter', true);
    }
});