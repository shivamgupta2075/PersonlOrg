@isTest
public class UpdateContactTest {
	   @isTest static void myTest() {
     	Account ObjAcc = new Account();
        ObjAcc.Name = 'Test';
        insert ObjAcc;
        
        list<contact> lstcon = new list<Contact>();
        
        Contact objcon1 = new Contact();
        objcon1.LastName = 'Test1';
        objcon1.Accountid = objAcc.id ;
        lstcon.add(objcon1);
        
        Contact objcon2 = new Contact();
        objcon2.LastName = 'Test2';
        objcon2.Accountid = objAcc.id ;
        lstcon.add(objcon2);
        
        upsert lstcon;
        
        Delete objcon1;
        Delete objcon2;
    }
    
           
    }