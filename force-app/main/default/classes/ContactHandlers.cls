public class ContactHandlers {
    public static void check(set<Id> accIdList){
        map<Id,integer> MapOfNumber = new map<Id,integer>();
        List<AggregateResult> allCon = [Select count(id)NumberofContact ,AccountId from Contact where accountId IN: accIdList 
                                        Group by AccountId];
        List<Account> acclIst = new List<Account>();
        if(allCon != null ){
            for(AggregateResult  con: allCon){
                Account acc = new Account();
                acc.Id = (Id)con.get('AccountId');
                acc.Number_of_Contacts__c = (Integer)con.get('NumberofContact');
                acclIst.add(acc);  
            }
        }
        if(acclIst != null){
           // update acclIst;
        }
    }
}