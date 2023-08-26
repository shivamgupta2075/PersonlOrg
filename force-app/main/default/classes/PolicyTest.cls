@isTest 
public class PolicyTest {
    static testMethod void insertNewUser() {
        
      
        Policy__c p = new Policy__c ();
        p.Policy_Tenure__c = '3 Years';
        p.Policy_Type__c = 'Health Insurance';
        insert p;
    }}