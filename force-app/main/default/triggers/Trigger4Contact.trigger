trigger Trigger4Contact on Contact (after insert , after delete ,after update  ) {    
   set<Id> SetconID = new set<Id>();     
    if(Trigger.isInsert || Trigger.isupdate )
    {
      for (Contact con : Trigger.new)
      {
        SetconId.add(con.AccountId);
      }   
    }
      if(Trigger.isDelete || Trigger.isupdate )
    {
      for (Contact con : Trigger.old)
      {
        SetconId.add(con.AccountId);
      }   
    }
    Map<Id, List<Contact>> accMap = new Map<Id, List<Contact>>();       
    list<contact> checkforzero =  new list<contact>([SELECT Id, AccountId, Name FROM Contact where AccountId in: SetconID ]);//A1 c1,c2    A2 c3,c4

   
 for(Contact cont :checkforzero)
  { 
      
        if(accMap.containsKey(cont.AccountId)) 
        {
            List<Contact> templist = accMap.get(cont.AccountId);
            templist.add(cont);
            accMap.put(cont.AccountId, templist);
        }
       else 
        {
            accMap.put(cont.AccountId, new List<Contact> { cont });
        }
  }    
   //For Name 
    List<String> NameList = new List<String>();
        for(contact conName :  checkforzero)
        {
            NameList.add(conName.Name);
        }
    String commaSepName= String.join(NameList, ', ');
     
    List<account> tempAccount =  new List<account>();
     for(id AccountId : SetconID  )
    { //A0 ,A1,A2
        account ar =  new account();
        ar.Id = AccountId ;
        
        if(accMap.containsKey(AccountId))
        {
             ar.Number_Of_Contacts__c = accMap.get(AccountId).size(); 
            ar.Siblings__c = accMap.get(AccountId).size() -1 ;
           ar.Name_Of_Contacts__c = commaSepName;            
        }
        else
        {
             ar.Number_Of_Contacts__c = 0;
            ar.Name_Of_Contacts__c = null; 
            ar.Siblings__c = null ;
        }
        
       tempAccount.add(ar);   
    }
          update tempAccount;   
}