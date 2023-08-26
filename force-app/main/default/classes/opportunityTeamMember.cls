public with sharing class opportunityTeamMember {
    //fetch picklist values from custom object in lwc
    @AuraEnabled(cacheable=true)
    public static List < customValueWrapper > pickListValueDynamically(sObject customObjInfo, string selectPicklistApi) {
        Schema.DescribeSObjectResult objDescribe = customObjInfo.getSObjectType().getDescribe(); 
        map < String, Schema.SObjectField > customFieldMap = objDescribe.fields.getMap();    
        list < Schema.PicklistEntry > custPickValues = customFieldMap.get(selectPicklistApi).getDescribe().getPickListValues();
        list <customValueWrapper> customObjWrapper = new list <customValueWrapper> ();
        if(custPickValues != null)
        {
            for (Schema.PicklistEntry myCustPick: custPickValues) {
                customValueWrapper selectOptionValueWrapper = new customValueWrapper();
                selectOptionValueWrapper.custFldlabel = myCustPick.getLabel();
                selectOptionValueWrapper.custFldvalue = myCustPick.getValue();
                customObjWrapper.add(selectOptionValueWrapper);
            }
        }
        return customObjWrapper;
    }
    public with sharing class customValueWrapper {
        @auraEnabled public string custFldlabel {get;set;}
        @auraEnabled public string custFldvalue {get;set;}
    }
    @AuraEnabled(cacheable=true)
    public static List<Records> findRecords( String ObjectName, String field, String searchString, Integer NumRecords ) {
        List<Records> recordsList = new List<Records>();
        try {
            String query = 'SELECT Id, ' + field + ' FROM '+ objectName + ' WHERE '+ field +' LIKE ' +
                '\'' + String.escapeSingleQuotes(searchString.trim()) + '%\'' + ' LIMIT ' + NumRecords;
            System.debug(query);
            for(SObject s : Database.query(query)){
                Records record = new Records();
                record.Id = String.valueOf(s.get('id'));
                record.val = String.valueOf(s.get(field));
                recordsList.add(record);
            } 
        } catch (Exception err) {	    	
            throw new AuraHandledException(err.getMessage());
        }
        
        return recordsList;
    }
    
    public class Records{
        @AuraEnabled public String Id {get;set;}
        @AuraEnabled public String val {get;set;}
    }
}