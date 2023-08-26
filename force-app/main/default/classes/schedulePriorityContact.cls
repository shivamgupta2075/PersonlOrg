global class schedulePriorityContact implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Contact> lList = new List<Contact>([Select Id, Contacts_Priority__c from Contact]);
        system.debug('ch'+lList);
       
			
                for(Contact l: lList) 
                {
				l.Contacts_Priority__c = 'High';
				}
                update lList;
            
			
		
    }
}