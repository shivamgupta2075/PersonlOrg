public class Handler_Position_Candidate {
    
    public static void handleupdatePosition(set<id> serPositionId ){
        list<string> updateposList = new list<string>();
        list<string> canStatus = new list<string>();
        list<id> setOfId = new list<id>();
        map<id,list<id>> candidateWithPosition = new map<id,list<id>>();
        list<Id> positionIdOFCandidate = new list<Id>();
        list<JobApplication__c> jons = new list<JobApplication__c>([select id , Positions__c, Candidates__c from JobApplication__c where Candidates__c in :  serPositionId  ]);
        for(JobApplication__c cust:jons){
            positionIdOFCandidate.add(cust.Positions__c);
        }
        list<Position__c> posList = new list<Position__c>([select id,status__c from Position__c where id in :positionIdOFCandidate]);
        list<JobApplication__c> CandidateList = new list<JobApplication__c>([select id , Positions__c, Candidates__c,Candidates__r.status__c from JobApplication__c where Positions__c in :positionIdOFCandidate ]);    
        system.debug('CandidateList'+CandidateList);
        for(JobApplication__c candit:CandidateList){
            if(candidateWithPosition.containsKey(candit.Positions__c)){
                list<id> temp = candidateWithPosition.get(candit.Positions__c);
                temp.add(candit.Candidates__c);
                candidateWithPosition.put(candit.Positions__c,temp);
            }
            else{
                candidateWithPosition.put(candit.Positions__c,new list<id>{candit.Candidates__c});
            }
        }
        for(list<id> candi : candidateWithPosition.Values()){
            for(integer i=0; i<candi.size(); i++)
            {
                setOfId.add(candi[i]);
            }
        }        
        list<Candidate__c> ca = new list<Candidate__c>([select id,status__c from Candidate__c where id in :setOfId]);   
        for(Candidate__c listOfCandidate : ca)
        {
            canStatus.add(listOfCandidate.status__c);  
        }
        integer b=0;
        for(integer i=0; i<canStatus.size(); i++){
            if(canStatus[i] == 'Approved')
            {
                b++;
            }
        }
        system.debug(b);
        if(b == canStatus.size()){
            for (position__c pos : posList)
            {
                pos.status__c =  'Approved';  
            }
        }
        update posList; 
    }
}