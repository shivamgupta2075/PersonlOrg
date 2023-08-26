public inherited sharing class lwcController {
    @AuraEnabled
    public static List<Account> insertAccount(List<Account> accountObj){
        System.debug(accountObj);
        try {
            insert accountObj;
            return accountObj;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
 
}