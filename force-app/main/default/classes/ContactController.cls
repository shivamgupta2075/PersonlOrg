public class ContactController {
        
    @AuraEnabled
    public static List<Contact> getContacts(Contact cont) {
        // Getting the list of contacts from where Id is in accountIds
                List<Contact> contactList = [SELECT Id,FirstName, Email,LastName FROM Contact where LastName =:cont.LastName];
                // Returning the contact list
        return contactList;
    }
    @AuraEnabled
    public static List<Contact>	 delcont (id contactids)
    {
         List<Contact> contactstodelete = [SELECT Id FROM Contact where id =: contactids];
        
        delete contactstodelete;
      
        return contactstodelete;
    }
    
  
     @AuraEnabled
    public static Contact updatecont (Contact contactids)
    {
        update contactids;
        return contactids;
       
    }
       @AuraEnabled
    public static Contact insertContact (Contact contactids)
    {
        insert contactids;
        return contactids;
       
    }
    
}