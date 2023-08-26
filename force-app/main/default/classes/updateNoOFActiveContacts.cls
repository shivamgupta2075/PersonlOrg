public class updateNoOFActiveContacts {
    public static void HandleNoOFActiveContacts(set<id> setAccId ){
        List<Account> AllActiveContact = new List<Account>();  
        List<Id> Al = new List<Id>();
        if(setAccId !=null)
        {
            for(contact con : [select Id,AccountId,isActive__c  from Contact where AccountId in :setAccId ])
            {
                if(con.isActive__c == 'Yes')
                {
                    Al.add(con.Id);  
                }
            }
            
            for(Id acc :setAccId )
            {
                account a = new account();
                a.Id = acc;
                a.No_of_Active_Contacts__c = Al.size();
                AllActiveContact.add(a);
                
            }
        }
        update AllActiveContact;
    }
    public static void HandlerUpdate(set<id> setAccId){
        List<account> all = new List<account>();
        for(Account acc : [SELECT Id,Name,(SELECT Id FROM Contacts where isActive__c = 'Yes') FROM Account WHERE Id IN :setAccId])
        {    
            account a = new account();
            a.Id = acc.Id;
            a.No_of_Active_Contacts__c = acc.Contacts.size();
            all.add(a);
        }
        update all;
    }
}