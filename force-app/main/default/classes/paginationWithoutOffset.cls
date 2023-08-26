public class paginationWithoutOffset {

    @AuraEnabled
    public static list<contact> getContactList(){
        return [SELECT Id, Name, Account.Name, Phone, Email FROM Contact];
    }
    
    
    
    
}