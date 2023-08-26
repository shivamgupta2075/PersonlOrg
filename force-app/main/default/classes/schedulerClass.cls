global class schedulerClass implements Schedulable

{
    global void execute(SchedulableContext sc){
        WrapperClassApex.getBlogs();
        system.debug('testingWrapper');
    }
    
}