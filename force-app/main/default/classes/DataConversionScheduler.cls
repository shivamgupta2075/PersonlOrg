public class DataConversionScheduler implements Schedulable{
  
    public void execute(SchedulableContext SC) {
      System.enqueueJob(new DataConversionQueueable());
   }

}