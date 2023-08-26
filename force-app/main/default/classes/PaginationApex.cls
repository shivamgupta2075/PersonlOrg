public class PaginationApex {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getAllOpp(){
        return [select Account.Name,Name,Amount,account.phone from Opportunity where account.Name != null limit 2];
        
    }

}