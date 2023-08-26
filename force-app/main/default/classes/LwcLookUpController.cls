public with sharing class LwcLookUpController {
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
    @AuraEnabled(cacheable=true)
    public static List<String> getPickList(String objectName, String fieldName) {
        List<String> values = new List<String>();
        List<Schema.DescribeSobjectResult> results = Schema.describeSObjects(new List<String>{objectName});
        
        for(Schema.DescribeSobjectResult res : results) {
            for (Schema.PicklistEntry entry : res.fields.getMap().get(fieldName).getDescribe().getPicklistValues()) {
                if (entry.isActive()) {
                    values.add(entry.getValue());
                }
            }
        }
        return values;
    }
    @AuraEnabled (cacheable=true)
    public static List<User> getUserRoles(){
        return [SELECT Name from User];
    }
    @AuraEnabled (cacheable=true)
    public static List<OpportunityTeamMember> getOpportunityTeamMember(){
        return [SELECT OpportunityAccessLevel FROM OpportunityTeamMember];
    }
}