({
    getContactList: function(component, pageNumber, pageSize) {
        var action = component.get("c.getContactData");
     
        action.setParams({
            "pageNumber": pageNumber,
            "pageSize": pageSize
        });
        action.setCallback(this, function(result) {
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                var resultData = result.getReturnValue();
                component.set("v.ContactList", resultData.contactList);
                component.set("v.PageNumber", resultData.pageNumber);
                component.set("v.TotalRecords", resultData.totalRecords);
                component.set("v.RecordStart", resultData.recordStart);
                component.set("v.RecordEnd", resultData.recordEnd);
                component.set("v.TotalPages", Math.ceil(resultData.totalRecords / pageSize));
                console.log("tota helper"+Math.ceil(resultData.totalRecords / pageSize));
            var totalPageSize = component.get("v.TotalPages");          
            console.log('got value ',totalPageSize);  
            var limitPerPage = 3;
            var myResults =[];  
            var numberOfItems = myResults;
			
                      
            for (var i = 1; i <=(totalPageSize); i++) {
                      myResults.push(i);                  
                
            }
         	component.set("v.pageCounterInfo",myResults);     
            
           
        	
      console.log(myResults); 
            }
            
        });
         
        $A.enqueueAction(action);
        
        
    },



   	
  
})