@isTest 
public class updatePriorityTest 
{
    static testMethod void testMethod1() 
    {
        
        Test.startTest();
        
        updatePriorityFieldInContacts obj = new updatePriorityFieldInContacts();
        DataBase.executeBatch(obj); 
        
        Test.stopTest();
    }
}