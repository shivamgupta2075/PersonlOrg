public with sharing class create_standard_OLI {
 
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getOpps( String searchKey) {
        String query = 'SELECT  Name,ProductCode , UnitPrice,product2.family, product2.Description FROM PricebookEntry';
        system.debug('query---'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
       
        return Database.query( query );
    }
    @AuraEnabled(cacheable=true)
    public static List<Product2> saveAccounts( String accountList) {
        System.debug('accountLiat'+accountList);
        return null;

       
        
    }
}