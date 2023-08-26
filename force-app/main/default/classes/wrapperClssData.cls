public with sharing class wrapperClssData{
    
    @AuraEnabled
    public static void getBlogs() {
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest(); 
        request.setEndpoint(system.label.DatedConversionRateUrl);
        request.setMethod('GET');
        HTTPResponse response = http.send(request);
        mainwrapper deserializeResults;
        
        if(response.getStatusCode() == 200) {
            deserializeResults = (mainwrapper)JSON.deserialize(response.getBody().replace('date', 'date_x'), mainwrapper.class);
        }  
        
        List<DatedConversionRate> dcrList = new List<DatedConversionRate>();
        
        if(deserializeResults != null){
            DatedConversionRate dcr = new DatedConversionRate();
            dcr.IsoCode = 'GBP';
            dcr.ConversionRate  = deserializeResults.rates.GBP ;
            dcr.StartDate = deserializeResults.date_x; 
            DatedConversionRate dcr1 = new DatedConversionRate();
            dcr1.IsoCode = 'SGD';
            dcr1.ConversionRate  = deserializeResults.rates.SGD ;
            dcr1.StartDate = deserializeResults.date_x;
            dcrList.add(dcr1);
            dcrList.add(dcr);
        }
      
        string frdd = JSON.serialize(dcrList);
       JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject(); 
        gen.writeFieldName('Records');
        //gen.writeStartArray();
        gen.writeObject(frdd);
       // gen.writeEndArray();
        gen.writeEndObject();
        String jsonData = gen.getAsString();
        system.debug('jsonData'+jsonData);
        //  jsonData.replace('\n','');
        //jsonData= jsonData.replaceAll( '\\s+', '');
        // string datas = jsonData.replaceAll('\\\\', '');
        system.debug('jsonData'+jsonData);
       
        system.debug(jsonData.deleteWhitespace());


        
	      
    }
    
    public with sharing class mainwrapper{
        public Boolean success {get;set;} 
        public Integer timestamp {get;set;} 
        public String base {get;set;} 
        public date date_x {get;set;}
        public Rates rates {get;set;} 
        public mainwrapper (){}
    }     
    public with sharing class Rates {
        
        public Double USD {get;set;} 
        public Double SGD {get;set;} 
        public Double NZD {get;set;} 
        public Double JPY {get;set;} 
        public Double ISK {get;set;} 
        public Double GBP {get;set;} 
        public Double EUR {get;set;} 
        public Double AUD {get;set;} 
        public Double CAD {get;set;} 
        public Double CHF {get;set;} 
        public Rates (){}
    }
    public static void getRequestToken() { 
    
        string sessionId = UserInfo.getOrganizationId()+''+UserInfo.getSessionId().SubString(15);
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v46.0/composite/tree/DatedConversionRate');
        req.setBody('{ "records":[{"StartDate":"2021-09-11","ConversionRate":1.358435,"IsoCode":"SGD","attributes":{"referenceId":"rfr1","type":"DatedConversionRate"}},{"StartDate":"2021-09-11","ConversionRate":0.722195,"IsoCode":"GBP","attributes":{"referenceId":"rfr2","type":"DatedConversionRate"}}]}');
        req.setHeader('Authorization', 'OAuth ' + sessionId);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        HttpResponse res = h.send(req);
        system.debug('res'+res);
    }
    
}