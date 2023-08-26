public class UpdateContactHelper {
    
    public static void counttrigger(set<id> accidlist){
        System.debug('query: ' +accidlist); 
        list<account> acc = new list<account>();
        for(Account a:[select id,Name,Number_of_Contacts__c,(select id from contacts)from Account where id IN:accidlist]){
            if(a.contacts.size()>0)
                a.Number_of_Contacts__c = a.contacts.size();
            else{
                a.Number_of_Contacts__c = 0;
            }
            acc.add(a);
        }
        Database.SaveResult[] SR = database.update(acc,false) ;
        System.debug('SaveResult: ' + SR);        
    }
    
}