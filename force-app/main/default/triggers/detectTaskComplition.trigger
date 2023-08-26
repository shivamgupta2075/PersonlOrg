trigger detectTaskComplition on Task (before insert,before update)
{
    Set<Id> oppIds = new Set<Id>();
    for (Task listoFtask : trigger.new)
    {
        if (listoFtask.WhatId != null)
        {
            oppIds.add(listoFtask.WhatId);
        }
    }
    system.debug(oppIds);
    
    List<Task> tasksToCheck = [select Id,WhatId, status from Task  where WhatId IN :oppIds];
    map<id,string> checkTrue = new  map<id,string>();
    list<opportunity> opps = new list<opportunity>();
    
    for(task t : tasksToCheck)
        {
          if(oppIds!=null)
          {
              checkTrue.put(t.WhatId,t.Status);              
          }
           
        }
    system.debug('map'+checkTrue);
    for(id i : oppIds){
        opportunity op = new opportunity();
        op.task__c = true;
        opps.add(op);
    }
        
        
    
    system.debug('opps'+opps);
}