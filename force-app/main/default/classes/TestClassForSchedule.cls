@IsTest
public class TestClassForSchedule {
    
    @IsTest static void  testschedule() {
        
        Test.StartTest();
        
        schedulerClass exp = new schedulerClass();
        String sch = '0 05 11 * * ?';
        system.schedule('Report test',sch,exp);
        system.debug('system.schedule');
        Test.stopTest();
        
    }
}