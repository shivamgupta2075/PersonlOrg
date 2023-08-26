({
    doInit: function(component, event, helper) {
        
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value"); 
        helper.getContactList(component, pageNumber, pageSize);
       
       
    },
    nextPageThroughNumber: function(component, event, helper) {
     
        var pageNumber = component.get("v.PageNumber");
        console.log(pageNumber);
        var pageSize = component.find("pageSize").get("v.value");
        var idx = event.target.getAttribute('data-index');
        if(idx == pageNumber){
            helper.getContactList(component, pageNumber, pageSize);
        }
      else  if(idx >= pageNumber){
           
        pageNumber++; 
            helper.getContactList(component, pageNumber, pageSize);
        }
        else{
             
        pageNumber--;
            helper.getContactList(component, pageNumber, pageSize);
            
        }
        console.log("onclick",idx);
    },
  
     
    handleNext: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber++;
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    handlePrev: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber--;
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    onSelectChange: function(component, event, helper) {
        var page = 1
        var pageSize = component.find("pageSize").get("v.value");
        helper.getContactList(component, page, pageSize);
    },
})