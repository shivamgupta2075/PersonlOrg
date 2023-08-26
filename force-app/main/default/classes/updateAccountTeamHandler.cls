public class updateAccountTeamHandler {
    public static void HandlerInsert(list<customer__c> triggerNew){
        
        updateAccountTeamHelper.counttrigger(triggerNew);
    }
    public static void HandlerDelete(list<customer__c> triggerOld){
        
        
        updateAccountTeamHelper.counttriggerDelete(triggerOld);        
    }
   
}