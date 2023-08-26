@isTest
private class LeadProcessorTest {
@testSetup
    static void setup(){
        List<lead> leads = new List<lead>();
        for (integer i=1;i<=200;i++){
             leads.add(new Lead(LastName='Lead '+i, 
                Company='Lead', Status='Open - Not Contacted'));
        }
        insert leads;
       
    }
    static testmethod void test() {  
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
}