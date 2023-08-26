@isTest
public class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk() {
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i,ShippingState ='CA',BillingState ='AV');
            accts.add(acct);
        }              
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        List<Account> verifyAccts = [SELECT BillingState FROM Account];
        for(account acc : verifyAccts){
            System.assertEquals('CA',acc.BillingState,'Incorrect');
        }            
    }
}