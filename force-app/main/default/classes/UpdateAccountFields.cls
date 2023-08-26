public class UpdateAccountFields implements Database.Batchable<sObject>{
    /*
String crDate = '2021-06-04T11:54:14.000+0000';
Id batchInstanceId = Database.executeBatch(new UpdateAccountFields(crDate), 5);
*/
    
    public final String CreatedDatesDate;
    
    
    public UpdateAccountFields(String crDate){
        CreatedDatesDate=crDate;
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC){
        String Query ='Select Id from Account';
        Query = Query+' where CreatedDate ='+CreatedDatesDate;
        system.debug('Query'+Query);
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, 
                        List<sObject> scope){
                            system.debug('scope'+scope);
                        }
    
    public void finish(Database.BatchableContext BC){
        
    }
    
}