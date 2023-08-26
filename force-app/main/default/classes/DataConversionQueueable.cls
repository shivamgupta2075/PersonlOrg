public class DataConversionQueueable implements Queueable, Database.AllowsCallouts {

    public void execute(QueueableContext context) {
      //  ExampleHelper.makeWebserviceCallout();
	WrapperClassApex.getBlogs();
    }

}