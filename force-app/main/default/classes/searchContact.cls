public with sharing class searchContact {
    @AuraEnabled
    public static List<Contact> getContacts(Contact con) {
        system.debug('con'+con);
        if(con.FirstName == null){
            system.debug('error');
        } 
        
        string str ;
        if(con.Email == '' && con.FirstName == '' && con.LastName == ''){
            str = ' where LastName = \''+null+ '\'';
        }
        else if(con.Email != '' && con.FirstName != '' && con.LastName != ''){
            str = ' Where FirstName = \''+con.FirstName+ '\' AND Email = \''+con.Email + '\'  AND LastName = \''+con.LastName+ '\'';
        }
        else if(con.LastName  != ''){
             str = ' where LastName LIKE \''+con.LastName+ '%\'';
        }
        else if(con.FirstName != ''){
             str = ' where FirstName LIKE \''+con.FirstName+ '%\'';
        }
        else if(con.Email != ''){
            str = ' where Email LIKE \''+con.Email+ '%\'';
        }
        else{
            str = 'null';
        }
        
        string FinalDataBase = 'SELECT Id , FirstName, Email,LastName,isActive__c FROM Contact'+str;
        system.debug('FinalDataBase'+FinalDataBase);
        list<Contact> querystring = database.query(FinalDataBase);
        system.debug('querystring'+querystring);
        return querystring;
    }
    @AuraEnabled
    public static void updateContacts(List<Id> Id) {
        List<Contact> contactList1 = new List<Contact>();
        for(id ids : Id){
            contact c = new contact();
            c.Id =ids;
            if(c.isActive__c == 'No'){
                c.isActive__c ='Yes';
            	contactList1.add(c);
            }
            else{
               c.isActive__c ='No';
            	contactList1.add(c); 
            }
            
        }
        update contactList1;
        
        
    }
    
    
}