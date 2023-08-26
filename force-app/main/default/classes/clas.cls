public inherited sharing class clas {
    @AuraEnabled
    public static List<Account> insertAccount(Account accountObj){
        List<Account> acc = new  List<Account>([select id,Name from Account Where Name = 'accountObj']);
        try {
            insert acc;
            return acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
 
}