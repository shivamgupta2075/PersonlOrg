public class Task2AllContactDataBase {
     
    @AuraEnabled
    Public static List<Contact> getContactList(){
        //get all contact list
        List<Contact> conList = [SELECT Id, Name, Account.Name, Phone, Email FROM Contact];
       
        return conList;
    }
   
    @AuraEnabled 
    public static List<Contact> delSlctRec (List<String> slctRec)
    {
        
        List<Contact> delRec = [SELECT Id FROM Contact WHERE Id IN: slctRec ];
		delete delRec;       
        return delRec;
       
    }
    
    
    
    
}