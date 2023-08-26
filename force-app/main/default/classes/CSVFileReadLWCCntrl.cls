public with sharing class CSVFileReadLWCCntrl {
    @AuraEnabled
    public static list<Contact> csvFileRead(Id contentDocumentId , string accountid){
        //accountid = '0012y00000CbA7jAAF';
        System.debug('accountid------------->'+accountid);
        list<Contact> contactInsertList = new list<Contact>();
        if(contentDocumentId != null) {
            
            // Fetch File Data based on the basic of document id 
            ContentVersion contentVersionObj = [SELECT Id, VersionData FROM ContentVersion WHERE ContentDocumentId =:contentDocumentId];
            // split the file data
            list<String> csvRecordsList = contentVersionObj.VersionData.toString().split('\n');

            for(Integer i = 1; i < csvRecordsList.size(); i++){
                Contact contactObj = new Contact();
                list<String> csvRowData = csvRecordsList[i].split(',');
                contactObj.LastName = csvRowData[0]; // accName
                contactObj.AccountId = accountid;
                contactInsertList.add(contactObj);
            }
        
            try{    
                if(!contactInsertList.isEmpty()) {
                   insert contactInsertList;
                }
            }
            catch (Exception ex) {
                throw new AuraHandledException(ex.getMessage());
            } 
        }
        return contactInsertList;    
    }
}