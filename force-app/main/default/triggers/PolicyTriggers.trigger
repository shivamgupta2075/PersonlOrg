trigger PolicyTriggers on Policy__c (before insert, before update ) {
    set<id> setId = new set<id>();
    if(trigger.isInsert )
    {
        for(Policy__c p : trigger.new )
        {
           setId.add(p.Id);
        }
    }
    map<string,decimal> healthmap = new map<string,decimal>();
    map<string,decimal> carmap = new map<string,decimal>();
    healthmap.put('3 yrs',0.8);
    healthmap.put('5 yrs',0.6);
    carmap.put('3 yrs', 0.7 );
    carmap.put('5 yrs', 0.5);
    map<string,map<string,decimal>> mainmap = new map<string,map<string,decimal>>();
    mainmap.put('CarInsurance',carmap);
    mainmap.put('HealthInsurance',healthmap );
    system.debug(mainmap);
   
    
    
    List<Policy__c> listPolicies = new List<Policy__c>([SELECT Id,Policy_Amount__c,Policy_Tenure__c,Policy_Type__c from Policy__c WHERE Id IN:setId]);
    for (Policy__c p : listPolicies )
    {
        if(p.Policy_Amount__c < 200000 )
        {
            system.debug('You Are Not Eligible For ANY Policies');
        }
        else {
          
          decimal discount = mainmap.get(p.Policy_Type__c).get(p.Policy_Tenure__c);
           p.Policy_Amount__c = p.Policy_Amount__c - (p.Policy_Amount__c * discount);
            
        }
    }
    

}