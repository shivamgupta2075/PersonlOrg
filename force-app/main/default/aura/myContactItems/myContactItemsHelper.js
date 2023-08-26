({
    deleteContact: function(component, event, helper) {
      	var inputdata =  component.get("v.expense.Id");
        console.log(inputdata);
       var action = component.get("c.delcont");
         action.setParams
         ({
             "contactids":inputdata
         });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state==="SUCCESS")
            {
              console.log("Success");
                location.reload();
            }
             else{
              console.log("Error To delete");
                            }
         
        });
        $A.enqueueAction(action);
		       
    },
    openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
    updateContacts: function(component, event, helper) {
      
        var inputdata =  component.get("v.expense");
        console.log(inputdata);
       var action = component.get("c.updatecont");
         action.setParams
         ({
             "contactids":inputdata
         });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state==="SUCCESS")
            {
              console.log("Success");
                
                location.reload();
            }
             else{
              console.log("Error To Update");
                            }
         
        });
        $A.enqueueAction(action);
      
		       
    },
   
    
})