trigger Position_Candidate on Candidate__c (after update) {
    
    set<id> serPositionId = new set<id>();
        if(trigger.isUpdate)
        {
            for(Candidate__c c : trigger.new)
            {
                if(c.status__c == 'Approved')
                {
                    serPositionId.add(c.Id);
                }                   
            }
        } 
    
    if(!serPositionId.isEmpty()){
      Handler_Position_Candidate.handleupdatePosition(serPositionId);    
    }
    
    }