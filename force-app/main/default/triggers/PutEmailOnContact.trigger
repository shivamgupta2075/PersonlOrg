trigger PutEmailOnContact on Contact (before insert ) {

     if(trigger.isBefore){
        if(trigger.isInsert)
        {
           updateEmailOnContact.HandlerInsert(trigger.new);
        }
     }
    
}