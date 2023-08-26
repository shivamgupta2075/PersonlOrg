trigger vdcommTrigger on VDComm_Solution__c (before insert) {
    if(trigger.isInsert)
    {
        for ( VDComm_Solution__c vdc : trigger.new){
            if(vdc != null)
            {
                vdc.Total_Extensions__c = vdc.Total_Amount__c / vdc.Extension_Price__c;
                vdc.Remaining_Extensions__c = vdc.Total_Extensions__c - vdc.Used_Extension__c;
                
            }
        }
    }

}