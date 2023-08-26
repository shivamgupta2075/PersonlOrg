trigger closedWonToClosedDate on Opportunity (before update) {

    map<id,Opportunity> oppOld = trigger.oldMap;
    map<id,Opportunity> oppNew = trigger.newMap;
    set<id> keys = oppOld.keySet();
    for(Id rid :keys )
    {
        Opportunity oldOpportunity = oppOld.get(rid);
        Opportunity newOpportunity = oppNew.get(rid);
        if(oldOpportunity.StageName =='Closed Won')
        {
            newOpportunity.CloseDate =System.today();
            newOpportunity.Type = 'New Customer';
        }
    }
    
    
    
    



}