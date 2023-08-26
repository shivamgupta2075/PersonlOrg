public class updateAccountTeamHelper {
    public static void counttrigger(list<customer__c> sortedAccountId){
        
        list<AccountTeamMember> accmemberList = new list<AccountTeamMember>();
        for(customer__c c: sortedAccountId)
        {
            AccountTeamMember accmember = new AccountTeamMember();
            accmember.AccountId = c.Account__c;
            accmember.TeamMemberRole = 'Account Manager';
            accmember.UserId = c.Account_Manager__c;
            accmemberList.add(accmember);
        }
        
        if(accmemberList!=null){
            system.debug('accList'+accmemberList);
            insert accmemberList;
            
        }
        
        
    }
    public static void counttriggerDelete(List<customer__c> custOldList){
    	Set<id> accSet = new Set<id>();
        List<AccountTeamMember> MemIdList = new List<AccountTeamMember>();
        map<id,Set<string>> accVsTeamMap = new map<id,Set<string>>();
        
        for(customer__c cust:custOldList){
            accSet.add(cust.Account__c);
        }
        
        List<customer__c> custList = [Select id,Account__c,Account_Manager__c from customer__c where Account__c in:accSet];
        for(customer__c cust:custList){
            if(accVsTeamMap.containsKey(cust.Account__c)){
                Set<string> temp = accVsTeamMap.get(cust.Account__c);
                temp.add(cust.Account_Manager__c);
                accVsTeamMap.put(cust.Account__c,temp);
            }
            else{
                accVsteamMap.put(cust.Account__c,new Set<string>{cust.Account_Manager__c});
            }
        }
                                          
        List<AccountTeamMember> AccTeamList = [Select id,AccountId,UserId from AccountTeamMember where AccountId in: accSet ];
       
        for(AccountTeamMember AccTeam:AccTeamList){
            if(accVsteamMap.containskey(AccTeam.AccountId)){
                if(!accVsteamMap.get(AccTeam.AccountId).contains(AccTeam.UserId)){
                    AccountTeamMember ATM = new AccountTeamMember();
                    ATM.id = Accteam.Id;
                    memIdList.add(ATM);	    
                }
            }
            else{
                AccountTeamMember ATM = new AccountTeamMember();
                ATM.id = Accteam.Id;
                memIdList.add(ATM);	
            }
        }
        delete memIdList;
    }
    /*public static void counttriggerUpdate(list<customer__c> NewIds , list<customer__c> oldIds){
        system.debug('newids'+NewIds);
        system.debug('Oldids'+oldIds);
        List<id> AccountidList = new List<id>();
        List<id> UseridList = new List<id>();  
        for(customer__c c: oldIds)
        {
            UseridList.add(c.Account_Manager__c);
            AccountidList.add(c.Account__c);
        }        
        list<AccountTeamMember> accmemberList = new list<AccountTeamMember>([Select id,AccountId,userid From AccountTeamMember where userid in : UseridList AND AccountId in :AccountidList]);
        system.debug('query'+accmemberList);
        delete accmemberList;
        list<AccountTeamMember> NewaccmemberList = new list<AccountTeamMember>();
        if(NewIds != null)
        {
            for(customer__c c: NewIds)
            {
                AccountTeamMember accmember = new AccountTeamMember();
                accmember.AccountId = c.Account__c;
                accmember.UserId = c.Account_Manager__c;
                accmember.TeamMemberRole = 'Account Manager';
                NewaccmemberList.add(accmember);
            } 
        }
        if(NewaccmemberList.size()>0)
        {
            insert NewaccmemberList;
        }
                                         
    }*/
   
 
    
    
    
}