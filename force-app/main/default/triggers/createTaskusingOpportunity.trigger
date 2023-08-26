trigger createTaskusingOpportunity on Opportunity (before insert,after insert) {
 List<Task> taskList = new List<Task>();
   if(trigger.isInsert)
   {
    for(Opportunity opr : Trigger.new){ 
         
           for(integer i=1;i<=3;i++)
           {
            Task newTask = new Task(whatID = opr.ID,Subject='Task' +opr.StageName +i);
            taskList.add(newTask); 
           }
          
    if(taskList.size()>0){
        insert tasklist; 
    }
        
    }
       
   }
  
}