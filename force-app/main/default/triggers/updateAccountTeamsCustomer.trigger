trigger updateAccountTeamsCustomer on customer__c (after insert,after delete,after update){
     if(trigger.isAfter){
        if(trigger.isInsert)
        {
            updateAccountTeamHandler.HandlerInsert( trigger.new) ;

        }
        if( trigger.isDelete)
        {
            updateAccountTeamHandler.HandlerDelete(trigger.Old);
        }
        if(trigger.isUpdate)
        {   
          updateAccountTeamHandler.HandlerDelete(trigger.Old);
          updateAccountTeamHandler.HandlerInsert( trigger.new) ;
        }
        
    }
}