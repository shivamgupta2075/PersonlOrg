public class currentExchangeRate {
    public static void updateCurrent(){
        map<string,string> alls = new map<string,string>();
        alls.put('1','0012y0000072oNVAAY');
        alls.put('2','0012y0000072oNaAAI');
        string q = 'Select Id from account where Id IN:allSi';
        list<Account> all = database.query(q);
        system.debug('a'+all);
        
    }
}