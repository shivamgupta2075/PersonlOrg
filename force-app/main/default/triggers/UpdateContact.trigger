trigger UpdateContact on Contact (after insert,after delete ,after update,before insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            set<id> setAccId = new set<id>();
            for(Contact  con :trigger.new ){
                setAccId.add(con.AccountId);            
            }
            updateNoOFActiveContacts.HandleNoOFActiveContacts(setAccId);
            
            //  UpdateContactHandler.HandlerInsert(trigger.new);
        }
        if( trigger.isDelete)  
        {
            set<id> setAccId = new set<id>();
            for(Contact  con :trigger.old ){
                setAccId.add(con.AccountId);            
            }
            updateNoOFActiveContacts.HandleNoOFActiveContacts(setAccId);
            //UpdateContactHandler.HandlerDelete(trigger.Old);
        }
        if(trigger.isUpdate)
        {   
            set<id> setAccId = new set<id>();
            for(Contact  con :trigger.old ){
                setAccId.add(con.AccountId);            
            }
            for(Contact  con :trigger.new ){
                setAccId.add(con.AccountId);            
            }
            updateNoOFActiveContacts.HandlerUpdate(setAccId);
            //UpdateContactHandler.HandlerUpdate(trigger.New, trigger.Old ,trigger.newMap,trigger.oldMap);
        }
        
    }
    if(trigger.isBefore){
        if(trigger.isInsert)
        {
            
            //updateEmailOnContact.HandlerInsert(trigger.new); 
        }
        
    }  
    
}