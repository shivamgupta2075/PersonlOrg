({
	doInit : function(component, event, helper) {
		alert("Hy");
	},
     
    search: function(component, event, helper) {
        
		var inputData = component.find("ContactList");
        console.log(inputData);
        var action = component.get("c.getContacts");
		action.setParams({ 
            cont : "inputData"
        });
        console.log('action'+action);
        action.setCallback(this ,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log('success');
            }
            else{
                console.log("error");
            }
        });
        $A.enqueueAction(action);
        
    }
})