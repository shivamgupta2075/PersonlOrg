public class getAccountdetails {
    @AuraEnabled(cacheable=true)
    public static list<Account> getAcc(string searchValues){
        if(String.isEmpty(searchValues)){
            return [select id,name from account limit 20];
            
        }
        else{
            searchValues =  '%'+searchValues+'%';
            return [select id,name from account where Name Like :searchValues];
        }
        
    }
}