({
    searchingData:function(component){  
        var tryData =  component.get('v.InsertedContacts');
        var action = component.get('c.getContacts');
        action.setParams
        ({
            con : tryData
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state==="SUCCESS" || state==='DRAFT')
            {
                var pageSize = component.get("v.pageSize");
                var allData = response.getReturnValue();
                component.set("v.totalRecords", allData.length);
                component.set("v.startPage",0);
                component.set("v.endPage",pageSize-1);
                var PaginationList = [];
                for(var i=1; i<= pageSize; i++){
                    if(allData.length> i)
                        PaginationList.push(response.getReturnValue()[i]); 
                    
                }
                component.set('v.PaginationList', allData);
                component.set('v.isNoContent','false');
                if(response.getReturnValue().length > 0 ){
                    
                    component.set('v.ContactData', PaginationList);
                    component.set("v.column", [
                        { label: "First Name ", fieldName: "FirstName", type: "text" },
                        { label: "Last Name", fieldName: "LastName" ,sortable:true, type: "text" },
                        { label: "Email", fieldName: "Email",sortable:true, type: "Email" },
                        { label: "IsActive", fieldName: "isActive__c", type: "text"}
                    ]); 
                    
                }
                
                else{
                    component.set('v.isNoContent','true');
                }     
                component.set('v.totalPages',allData.length);
                var totalPages = component.get('v.totalPages');
                var pageSize = component.get("v.pageSize");
                var pageNumber = ((totalPages)/(pageSize));
                var a = Math.ceil(pageNumber);
                component.set('v.pageNumber',a);
            }
            else{
                alert('error');
            } 
        });
        $A.enqueueAction(action);
    },
    updateValueData:function(component){
        var getIds = component.get("v.getId");
        var action = component.get('c.updateContacts');
        action.setParams
        ({
            Id : getIds
        });
        $A.enqueueAction(action); 
        var a = component.get("c.searching");
        $A.enqueueAction(a);
    },
    next : function(component, event){
        var dataList = component.get("v.PaginationList");
        var end = component.get("v.endPage");
        var pageSize = component.get("v.pageSize"); 
        var start = component.get("v.startPage");
        var Paginationlist = [];
        var counter = 0;
        var pageNumber = component.get('v.pageNumber');
        var countPageNumber = 0;
        var countPage = component.get('v.countPage');
        for(var i=end+1; i<end+pageSize+1; i++){
            if(dataList.length > i){
                Paginationlist.push(dataList[i]);
                
            }
            counter ++ ;
        }
        start = start + counter;
        end = end + counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.ContactData', Paginationlist);    
       
        
    },
    previous :function(component, event){
        var dataList = component.get("v.PaginationList");
        var end = component.get("v.endPage");
        var pageSize = component.get("v.pageSize"); 
        var start = component.get("v.startPage");
        var Paginationlist = [];
        var counter = 0;
        for ( var i= start-pageSize; i < start ; i++ ) {
            if ( i > -1 ) {
                Paginationlist.push(dataList[i]);
                counter ++;
                
            } else {
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.ContactData', Paginationlist);
        var count = component.get('v.pageNumber');
        count = count+1;
        component.set('v.pageNumber', count);
        
    },
    
});