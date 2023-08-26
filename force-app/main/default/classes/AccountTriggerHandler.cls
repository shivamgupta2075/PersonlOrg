public class AccountTriggerHandler {
    Public static void CreateAccounts(List<Account>acctList){
        for (Account acc:acctList){
            if(acc.BillingState != acc.shippingState){
                acc.shippingState=acc.BillingState;
            }
        }
    }
}