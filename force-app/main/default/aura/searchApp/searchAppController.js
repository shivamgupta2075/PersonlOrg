({
    searching :function(component, event, helper) {
         component.set("v.column", [
                        { label: "First Name ", fieldName: "FirstName", type: "text" },
                        { label: "Last Name", fieldName: "LastName" ,sortable:true, type: "text" },
                        { label: "Email", fieldName: "Email",sortable:true, type: "Email" },
                        { label: "IsActive", fieldName: "isActive__c", type: "text"}
                    ]); 
        helper.searchingData(component);
        
    },
    doSelect:function(component, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        let obj =[] ; 
        for (var i = 0; i < selectedRows.length; i++){
            obj.push(selectedRows[i].Id);
        }
        var changeElement = component.find("updateCss");
        $A.util.removeClass(changeElement,"slds-hide");
        if(selectedRows.length == 0){
            $A.util.addClass(changeElement,"slds-hide");
        }
        component.set("v.getId",obj);
    },
    updateValue : function(component, event, helper) {
        helper.updateValueData(component);
        
    },
    
    handleNext: function(component, event, helper) {
        helper.next(component, event);
    },
    
    handlePrev: function(component, event, helper) {
        helper.previous(component, event);
    },
    startPage:function(component, event, helper) {
        helper.startPageData(component, event);
    },
    endPage:function(component, event, helper) {
        helper.endPageData(component, event);
    },
    clearText : function(component, event, helper){
        component.set('v.InsertedContacts.FirstName','');
        component.set('v.InsertedContacts.LastName','');
        component.set('v.InsertedContacts.Email','');
        
    }
    
})