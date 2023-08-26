trigger AddNumberOfContact on Account (after insert,after update,Before update ) {
    
    if(trigger.isAfter){
        if(trigger.IsUpdate){
            //AccountHandler.createContact(trigger.new,trigger.oldMap);
            
        }
    }
    if (trigger.isBefore ){
        if(trigger.isupdate){
            if(AccountHandler.recurssionCheck == FALSE){
                AccountHandler.countContact(trigger.new);   
            }
            
        }
        
    }
    
}