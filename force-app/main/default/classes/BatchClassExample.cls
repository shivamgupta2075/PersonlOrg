global class BatchClassExample implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        //String query = 'SELECT Id, Name FROM Account';
        //  return Database.getQueryLocator(query);
        return null;
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        
        wrapperClssData wc = new wrapperClssData();
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
    }
}