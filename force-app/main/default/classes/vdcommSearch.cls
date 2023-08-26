public with sharing class vdcommSearch {
      
    @AuraEnabled(cacheable=true)
    public static List<VDComm_Solution__c>  getContact(string searchKey){
        System.debug('searchKey'+searchKey);
        String query = 'SELECT Name, Total_Amount__c, Extension_Price__c, Total_Extensions__c, Remaining_Extensions__c, Used_Extension__c FROM VDComm_Solution__c';
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
       
        list<VDComm_Solution__c> conList =   Database.query(query);
        return conList;
        
    }
    @AuraEnabled(cacheable=true)
    public static List<VDComm_Solution__c>  getContactList(){
        return null;
    }
    
}