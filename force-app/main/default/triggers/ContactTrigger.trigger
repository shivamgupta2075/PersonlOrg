trigger ContactTrigger on Contact (after insert,after update) {
    
    if(trigger.isAfter){
        if(trigger.isUpdate || trigger.isInsert){
            Map<Id,Contact> conMap = new Map<Id,Contact>();
            set<Id> accIdList = new  set<Id>(); 
            for (Contact con :trigger.new){
                conMap.put(con.AccountId,con);
            }
            List<Contact> allAcc= [Select Id from Contact where AccountId In:conMap.keySet()];
            list<account> acList= new list<account>();
            for(account acc : [select id,name,Number_of_Contacts__c from account where id in:conMap.keySet()]){
                acc.Number_of_Contacts__c=allAcc.size();
                acList.add(acc);
            }
            if(acList!=null && acList.size()>0){
                update acList;
            }
        }    
    }
}