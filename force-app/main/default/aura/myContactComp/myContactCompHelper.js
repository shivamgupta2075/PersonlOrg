({
    fetchContacts : function(component,event,helper) {
		var inputdata =  component.get("v.newExpense");
        console.log(inputdata);
        var action =  component.get("c.getContacts");
       
        action.setParams({
            "cont": inputdata
           
        });
        
        action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
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
    newContacts :function(component,event,helper){
        var inputdata =  component.get("v.newExpense");
        console.log(inputdata);
         var action =  component.get("c.insertContact");
        action.setParams({
            "contactids": inputdata
           
        });
        
         action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
                               if(state === 'SUCCESS'){
                                  // var contactList = response.getReturnValue();
                                   console.log(contactList);
                                 //  component.set("v.contactList",contactList);
                               }
                               else{
                                   alert('Error In getting Data');
                                   
                               }
                           });
        $A.enqueueAction(action);
        
        
        
    },
})