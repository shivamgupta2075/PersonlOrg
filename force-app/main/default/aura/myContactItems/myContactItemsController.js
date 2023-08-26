({
	removeContacts : function(component, event, helper) {
        
	helper.deleteContact(component,event,helper);
		
	},
    editContact : function(component, event, helper)
    {
        helper.openModel(component,event,helper);
    },
    closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      helper.updateContacts(component,event,helper);
      component.set("v.isModalOpen", false);
   },
   
})