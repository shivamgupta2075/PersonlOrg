global class updatePriorityFieldInContacts implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query= 'SELECT Contacts_Priority__c from Contact';
        //return Database.QueryLocator(query);
        return Database.getQueryLocator(query); 
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> scope)
    {
        for(Contact l: scope)
        {
            l.Contacts_Priority__c ='Hot';
            system.debug(l);
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        system.debug('success');
    }
}