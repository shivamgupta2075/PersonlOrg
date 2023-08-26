public class updateEmailOncontactHelper {
	 public static list<contact> addEmail(list<contact> conList){
        
         if(conList.size()>0){
           for (contact con : conList)
         {
             con.Email = 'domain@grazitti.com';
             system.debug('Email'+con.Email);
           
         }
          
         }
         
		return conList;         
         
     }
}