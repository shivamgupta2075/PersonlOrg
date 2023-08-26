trigger DuplicateAccountFinder on Account (before insert, before update)
{
    
    set<id> idacc = new set<id>();
    
    
    
    

 for(Account a:Trigger.new)

 {
     map<string,string> acc = new map<string,string>();
     

 //List<Account> acc= List<Account>(["Select id from Account where Name=:a.Name and Rating=:a.Rating"]);

 }
    system.debug('Account name and Rating ' );
}