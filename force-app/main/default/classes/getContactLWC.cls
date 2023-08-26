public inherited sharing class getContactLWC {
    @AuraEnabled(cacheable=true)
    public static List<Contact>  getContact(string searchKey){
        System.debug('searchKey'+searchKey);
        String query = 'SELECT Id, FirstName, LastName, Title, Phone, Email FROM Contact';
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE FirstName LIKE :key';
        }
       
        list<contact> conList =   Database.query(query);
        return conList;
        
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact>  getFullContact( ){
        System.debug('ALlDAra'+[SELECT Id, FirstName, LastName, Title, Phone, Email FROM Contact]);
        return [SELECT Id, FirstName, LastName, Title, Phone, Email FROM Contact] ; 
    }
}