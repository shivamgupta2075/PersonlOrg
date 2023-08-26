public class DummyApex {
    
    public static void getApiData(){
        
        List<string> allString = new List<String>{'A', 'B','C', 'D'};
        Map<string,List<string>> mapofstring = new Map<string,List<string>>();
        string saIds = '1';
        mapofstring.put(saIds,allString);
        
        for(Object s :mapofstring.Values()){
            system.debug(mapofstring.get(saIds)); 
        }
        
    }
    
    
}