({
  doInit: function(component, event, helper) {
       component.set("v.column", [
          { label: "ID", fieldName: "Id", type: "Id" },
          { label: "Name", fieldName: "Name" ,sortable:true, type: "text" },
          { label: "Account Name ", fieldName: "Account", type: "text" },
          { label: "Phone", fieldName: "Phone", type: "text" },
          { label: "Email", fieldName: "Email",sortable:true, type: "Email" }
        ]);
    helper.getData(component, event, helper);
     
  },
   updateSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    }
});