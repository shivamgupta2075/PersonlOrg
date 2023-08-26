@isTest
public class opportunityTeamMember_TestClass {
    @isTest
    public static void TestMethod1() {
        Account acc = new Account(); 
        acc.Name = 'testM1'; 
        acc.Industry = 'Prospect';
        acc.AccountNumber ='783875';
        insert acc;
        opportunityTeamMember.customValueWrapper wrapper = new opportunityTeamMember.customValueWrapper();
        wrapper.custFldlabel = '';
        wrapper.custFldvalue ='';
        opportunityTeamMember.pickListValueDynamically( acc ,'Account_Type__c');
        opportunityTeamMember.findRecords('Account', 'Account_Type__c','testM1', 10);
        opportunityTeamMember.Records R = new opportunityTeamMember.Records();
        R.Id = '';
        R.val = '';
    }
}