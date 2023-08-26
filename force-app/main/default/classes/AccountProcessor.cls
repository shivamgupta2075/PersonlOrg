public class AccountProcessor {

    @future
    public static void countContacts (list<id> AccountIds)
    {
    List<Account> selectAccountIds = [SELECT id,Number_of_Contacts__c,(SELECT id from contacts) from account where id in : AccountIds];   
      for (account acc : selectAccountIds){
            List<Contact> con = acc.contacts;
            acc.Number_of_Contacts__c = con.size();
        }
		 update selectAccountIds;
    }



}