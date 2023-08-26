public with sharing class creatingPlaceorderApex {
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getAcc( String searchKey) {
        String query = 'SELECT  Name,Id FROM Account';
        system.debug('query---'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
       
        return Database.query( query );
    }
}