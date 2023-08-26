@isTest
private class DailyLeadProcessorTest{
    //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
    public static String CRON_EXP = '0 0 * * *';
    	
    
    
    static testmethod void testScheduledJob(){
             contact c  = new contact();
    	c.LastName = 'xyz';
         insert c;
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('Update priority value of Contacts', CRON_EXP, new schedulePriorityContact());
        
        // Stopping the test will run the job synchronously
        Test.stopTest();
    }
}