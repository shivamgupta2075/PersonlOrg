public class TaskTriggerHelper
{
    public static void UpdateOppStatusOnTaskUpdate(List<Task> tasks)
    {
        Set<Id> oppIds = new Set<Id>();
        for (Task task : tasks)
        {
            if (task.WhatId != null)
            {
               oppIds.add(task.WhatId);
            }
        }
        List<Task> tasksToCheck = [select Id from Task where Id IN :tasks];
        List<Opportunity> opps = [select Id,task__c from Opportunity where Id IN : oppIds];
        for (Opportunity opp : opps)
        {
           for (Task t : tasksToCheck)
           {
               if (opp.Id == t.WhatId)
               {
                 if(t.Status == 'completed')
                 {
                     opp.task__c = true;
                 }
               }
           }
        }
        update opps;
    }
}