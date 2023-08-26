public class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'Select id,LeadSource from Lead '
           
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        list<lead> addSource = new list<lead>();
      	for(lead l : scope)
        {
            l.LeadSource ='DreamForce';
        }
     
        update scope;
    }
    public void finish(Database.BatchableContext bc){
       system.debug('success');
    }
}