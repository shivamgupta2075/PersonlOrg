({
    //get Contact List from apex controller
 doInit : function(component, event, helper) {
        var action = component.get("c.getItem");
        action.setCallback(this, function(result){
            var state = result.getState();
            if ( state === "SUCCESS"){
                component.set("v.contactList",result.getReturnValue());
                console.log("success");
            }
            else{
                console.log("Error");
            }
        });
        $A.enqueueAction(action);
    },
     
    //Select all contacts
    handleSelectAllContact: function(component, event, helper) {
        alert("hy");
        /*var getID = component.get("v.contactList");
        var checkvalue = component.find("selectAll").get("v.value");        
        var checkContact = component.find("checkContact"); 
        if(checkvalue == true){
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",true);
            }
        }
        else{ 
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",false);
            }
        }*/
    },
     
    //Process the selected contacts
    deleteContacts: function(component, event, helper) {
      
		var selectedCom =  component.get("v.contactList");       
        var action = component.get("c.delItem");
      
        
        action.setParams({
          "conlist"   : selectedCom
        });
        action.setCallback(this, function(result){
            var state = result.getState();
           
        });
        $A.enqueueAction(action);
        var a = component.get("c.doInit");
         $A.enqueueAction(a);
       
         
       
        
    }
})