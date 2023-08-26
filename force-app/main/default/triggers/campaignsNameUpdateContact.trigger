trigger  campaignsNameUpdateContact on campaignmember (after insert , after delete ,after update )  {
Set<Id> leadIds = new Set<Id>();
    set<id> camp = new set<id>();
        if(trigger.isinsert || trigger.isupdate)
        {
           for (campaignmember c : trigger.new)
           {
            camp.add(c.id);
            }
        }

       list<Lead> leadDetail=new list<Lead>();
       map<Id,string> mapLeadIdByCampaign=new map<Id,string>();

       for(CampaignMember c:[Select Id,LeadId,Campaign.Name from  CampaignMember where ID IN:leadIds])
       {
                  leadIds.add(c.LeadId);
                  mapLeadIdByCampaign.put(c.LeadId,c.Campaign.Name);
       }

       for(Lead l:[Select Id,campaign_name__c from Lead where Id in :leadIds])
       {
         if(mapLeadIdByCampaign.get(l.id)!=null)
                 {
               l.campaign_name__c = mapLeadIdByCampaign.get(l.id);
                 }
            leadDetail.add(l);
         
        }

         update leadDetail;
    system.debug( leadDetail);
    system.debug(mapLeadIdByCampaign);
 }