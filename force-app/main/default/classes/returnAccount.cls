public class returnAccount {
    @AuraEnabled
    public static list<account> allaccounts(){
    return [SELECT Id from account ];
    }
    }