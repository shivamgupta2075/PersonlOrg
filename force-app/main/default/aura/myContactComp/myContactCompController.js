({
	 //searchContactList : function(component, event, helper) {
		//helper.fetchContacts(component,event,helper);
		
    //},
    CreateContactList:  function(component, event, helper){
        helper.newContacts(component,event,helper);
    },
    
    
    handlerUpdate : function(component, event, helper){
    
    var inputdata =  component.get("v.newExpense");
        console.log(inputdata);
        var action =  component.get("c.getContacts");
       
        action.setParams({
            "cont": inputdata
           
        });
        
        action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
            console.log(state);
                               if(state === 'SUCCESS'){
                                   var contactList = response.getReturnValue();
                                   console.log(contactList);
                                   component.set("v.contactList",contactList);
                                   
                               }
                               else{
                                   alert('Error In getting Data');
                                   
                               }
                           });
        $A.enqueueAction(action);
    },

})