public class updateEmailOnContact {
    
    public static void HandlerInsert(list<contact> triggerNew ){
        
        
        if(triggerNew.size()>0){
            for (contact con : triggerNew)
            {
                if(con.Email != null)
                {
                    system.debug('Email'+con.Email);
                    String strMain = con.Email;
                    String[] arrSplit = strMain.split('@');
                    con.Email = arrSplit[0]+'@grazitti.com';
                    System.debug('Actuall Value '+con.Email);
                }
                else{
                    con.Email = con.LastName+'@grazitti.com'; 
                }
            }
        }
        else{
            system.debug('Error');
        }
        
        
    }    
    
}