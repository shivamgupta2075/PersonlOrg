@isTest
public class opportunityEmailUpdateTest {
    static testMethod void updateNoOfOccurence(){

        account ac = new account();
        ac.Name = 'Tesla';
        ac.Email__c = 'sg@gmail.com';
        insert ac;
        Opportunity op = new Opportunity();
 		op.AccountId = ac.Id;
        op.StageName = 'Prospecting';
        op.CloseDate = date.today();
        op.Email__c = 'sg@gmail.com';
        op.Name ='Louis Vergan';
        insert op;
        
        
        
       
                
        Test.startTest();
        
        Test.stopTest();
        
        
    }
}