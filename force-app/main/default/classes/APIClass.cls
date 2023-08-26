public class APIClass {
    
    
    public static void getAPIdata (){
        
        string endpoint  = 'https://randomuser.me/api/';
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest(); 
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HTTPResponse response = http.send(request);
        mainwrapper deresult;
        if(response.getStatusCode() == 200) {
            system.debug('response.getBody()'+response.getBody());
            deresult = (mainwrapper)JSON.deserialize(response.getBody(),mainwrapper.class);
            system.debug('response'+deresult);
        }
        
    }
    public with sharing class mainwrapper{
        public List<Results> results {get;set;} 
        public mainwrapper (){}
    }
    public class Results{
        public String gender {get;set;} 
    }  
}