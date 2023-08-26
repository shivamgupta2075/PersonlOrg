public class SDR_CreditHandler {
    public static void handleNewSDR(List<Lead> newLead){
         List<Task> lstTask = new List<Task>();
         Task objTask;
        for(Lead objLead : newLead ) {
                 objTask = new Task(); 
                 objTask.OwnerId = objLead.OwnerId;
                 objTask.Subject = 'Call';
                 objTask.Priority = 'Normal';
                 objTask.Status = 'Not Started';
                 objTask.Description = objLead.Description;
                 objTask.WhoID = objLead.id;
            	objTask.TaskSubtype = 'Call';
                 lstTask.add(objTask);   
               }
           
            if(!lstTask.IsEmpty())
                system.debug('objTask'+objTask);
             	insert(objTask);
           } 
}