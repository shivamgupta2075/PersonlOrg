trigger trigger5 on Contact (after insert,after delete ,after update ) {
    
    set<id> sortedAccountId = new set<id>();
    
    if(trigger.isinsert || trigger.isupdate){
        for(contact con:trigger.new){
            sortedAccountId.add(con.AccountId);
        }        
    }
    if(trigger.isdelete || trigger.isupdate){
         for(contact con:trigger.old){
            sortedAccountId.add(con.AccountId);
        } 
    }
    
    map<id,list<contact>> conWithName =  new map<id,list<contact>>();
    list<contact> collectionOfIdWithName = new list<contact>([select id ,AccountId,Name from contact where Accountid in: sortedAccountId]);
    system.debug(collectionOfIdWithName);
    for (contact con : collectionOfIdWithName ){
        if(conWithName.containsKey(con.AccountId))
        {
            list<contact> templist = new list<contact>();
            list<contact> namelist = new list<contact>();
            templist.add(con);
            conWithName.put(con.AccountId, templist);
        }
        else
        {
                conWithName.put(con.AccountId, new List<Contact> {con});
        }
    }
   






















}