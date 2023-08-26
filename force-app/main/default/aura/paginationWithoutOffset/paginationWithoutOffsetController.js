({
	doInit : function(component, event, helper) {
        var action = component.get("c.getContactList");
        action.setCallback(this, function(result){
            var state = result.getState();
            if ( state === "SUCCESS"){
               	component.set("v.ContactList",result.getReturnValue())
                console.log("success");
            }
            else{
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
    },
})