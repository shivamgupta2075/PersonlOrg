public class opportunityEmailUpdate {
   /* public static void InsertEmail(set<id> setAccId ){
        List<string> oppEmail = new List<string>(); 
        List<string> AccEmail = new List<string>();
        List<integer> AllEmail = new List<integer>();
        List<Account> updateEmail = new List<Account>();
        List<Id> Al = new List<Id>();
       
        if(setAccId !=null)
        {
            for(Opportunity opp : [select Id,AccountId,Email__c  from Opportunity where AccountId in :setAccId ])
            {
                oppEmail.add(opp.Email__c);
            }
        }
        for(Account ac : [select id,Email__c from Account Where Id in : setAccId]){
            AccEmail.Add(ac.Email__c);
        }
        for(Integer i = 0; i < oppEmail.size() ; i++){
            if(AccEmail != null){
                if(AccEmail[0] == oppEmail[i]){
                    AllEmail.add(i);
                }   
            }
        }
        for(Id accList : setAccId ){
            account acc = new account();
            acc.Id =  accList;
            acc.Number_Of_Occurrences_of_Email__c = AllEmail.size();
            updateEmail.add(acc);
        }
        update updateEmail;
    }
    public static void HandlerUpdate(set<id> acctSet ){
        
    }   */
}