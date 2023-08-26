public class UpdateContactHandler {
    
    public static void HandlerInsert(list<contact> triggerNew ){
        set<id> accidlist = new set<id>();
        for(contact con:triggerNew){
            accidlist.add(con.Accountid);
        }
        UpdateContactHelper.counttrigger(accidlist);
        system.debug('HandlerInsert');
    }
    public static void HandlerDelete(list<contact> triggerOld){
        set<id> accidlist = new set<id>();
        for(contact con:triggerOld){
            accidlist.add(con.Accountid);
        }
        UpdateContactHelper.counttrigger(accidlist);
        system.debug('HandlerDelete');
    }
    public static void HandlerUpdate(list<contact> triggerNew  , list<contact>  triggerOld ,map<id,contact> triggerNewMap,map<id,contact> triggerOldMap){
        set<id> accidlist = new set<id>();
        system.debug('map'+triggerOldMap);
        for(contact con:triggerNew){
            system.debug('con'+con);
            system.debug('cghsgsh'+triggerOldMap.get(con.Id));
            if(triggerOldMap.get(con.Id).AccountId != triggerNewMap.get(con.Id).AccountId)
            {
                accidlist.add(con.Accountid);
                
            } 
            else{
                system.debug('LoopCheck/AccountId same');
            }
            
        }
        system.debug('acc'+accidlist);
        for(contact con:triggerOld){
            if(triggerOldMap.get(con.Id).AccountId != triggerNewMap.get(con.Id).AccountId){
                accidlist.add(con.Accountid);
            }
            
            
        }
        UpdateContactHelper.counttrigger(accidlist);
        system.debug('HandlerUpdate');
    }
    
}