trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> oppList = new List<Task>();
    List<Opportunity> toProcess = null;
    switch on Trigger.operationType {
        when AFTER_INSERT {
            // All inserted Accounts will need the Opportunity, so there is no need to perform the query
            toProcess = Trigger.New;
        }
        when AFTER_UPDATE {
            toProcess = [SELECT Id,StageName FROM Opportunity
                         WHERE Id IN :Trigger.New And StageName ='Closed Won'
                        ];
        }
    }
    for (Opportunity opp : toProcess) {
        // Add a default opportunity for this account
        oppList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}