@isTest
public class updateNoOFActiveContactsTest {
    static testMethod void updateNoOFActiveContacts(){
        List<contact> all = new List<contact>();
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        insert testAccount;
        Account testAccount1 = new Account();
        testAccount1.Name='Test Account1' ;
        insert testAccount1;
        Contact cont = new Contact();
        cont.FirstName='Test';
        cont.LastName='Test';
        cont.isActive__c = 'Yes';
        cont.Accountid= testAccount.id;
        insert cont;
        Contact cont1 = new Contact();
        cont1.FirstName='Test2';
        cont1.LastName='Test2';
        cont1.isActive__c = 'Yes';
        cont1.Accountid= testAccount.id;
        all.add(cont1);
        insert cont1;
        Contact c = new Contact();
        c.Id = cont1.Id;
        c.isActive__c = 'Yes';
        update c;
        
        
        Test.startTest();
       
        Test.stopTest();
    }
}