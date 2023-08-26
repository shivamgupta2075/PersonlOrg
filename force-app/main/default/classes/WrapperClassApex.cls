public with sharing class  WrapperClassApex {
    @future(callout=true)
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
            dcr.IsoCode = 'SGD';
            dcr.ConversionRate  = deserializeResults.rates.SGD ;
            dcr.StartDate = deserializeResults.date_x; 
            DatedConversionRate dcr1 = new DatedConversionRate();
            dcr1.IsoCode = 'NZD';
            dcr1.ConversionRate  = deserializeResults.rates.NZD ;
            dcr1.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr2 = new DatedConversionRate();
            dcr2.IsoCode = 'JPY';
            dcr2.ConversionRate  = deserializeResults.rates.JPY ;
            dcr2.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr3 = new DatedConversionRate();
            dcr3.IsoCode = 'ISK';
            dcr3.ConversionRate  = deserializeResults.rates.ISK ;
            dcr3.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr4 = new DatedConversionRate();
            dcr4.IsoCode = 'GBP';
            dcr4.ConversionRate  = deserializeResults.rates.GBP ;
            dcr4.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr5 = new DatedConversionRate();
            dcr5.IsoCode = 'EUR';
            dcr5.ConversionRate  = deserializeResults.rates.EUR ;
            dcr5.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr6 = new DatedConversionRate();
            dcr6.IsoCode = 'AUD';
            dcr6.ConversionRate  = deserializeResults.rates.AUD ;
            dcr6.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr7 = new DatedConversionRate();
            dcr7.IsoCode = 'CAD';
            dcr7.ConversionRate  = deserializeResults.rates.CAD ;
            dcr7.StartDate = deserializeResults.date_x;
            DatedConversionRate dcr8 = new DatedConversionRate();
            dcr8.IsoCode = 'CHF';
            dcr8.ConversionRate  = deserializeResults.rates.CHF ;
            dcr8.StartDate = deserializeResults.date_x;
            dcrList.add(dcr);
            dcrList.add(dcr1);
            dcrList.add(dcr2);
            dcrList.add(dcr3);
            dcrList.add(dcr4);
            dcrList.add(dcr5);
            dcrList.add(dcr6);
            dcrList.add(dcr7);
            dcrList.add(dcr8);
            
        }
        //system.debug('dcrList'+dcrList);
        if(dcrList != null){
            getJSONdata(dcrList); 
        }
        
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
    public static void getJSONdata(List<DatedConversionRate> dcrList){
        string frdd = JSON.serialize(dcrList);
        string jsonString = '{ "records":'+frdd+'}';
        Map<String, Object> hogwarts = (Map<String,Object>)JSON.deserializeUntyped(jsonString);
        Object[] arrayData = (Object[])hogwarts.get('records');
        Map<String, Object> dataAttributes = new Map<String, Object>();
        map<string,Map<String, Object>> alldata = new map<string,Map<String, Object>>();
        Map<String, Object> dataAttributesData = new Map<String, Object>();
        integer i =0;
        for(Object data:arrayData){
            dataAttributes = (Map<String, Object>)data;
            i=i+1;
            for(String attributeName:dataAttributes.keySet()){
                if(attributeName == 'attributes'){
                    dataAttributesData = (Map<String, Object>)dataAttributes.get('attributes');
                    for(string attr : dataAttributesData.KeySet()){
                        dataAttributesData.put('referenceId','rfr'+i);
                    }
                }
            }
            alldata.put(string.valueOf(i),dataAttributes);
        }        
        string Finalizedata = JSON.serialize(arrayData);
        string jsonStringss = '{ "records":'+Finalizedata+'}';
        getPostMethod(jsonStringss);
    }
    public static void getPostMethod(string jsonStringss){
        //  system.debug('j++++++++'+jsonStringss);
        string sessionId = UserInfo.getOrganizationId()+''+UserInfo.getSessionId().SubString(15);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v46.0/composite/tree/DatedConversionRate');
        req.setBody(jsonStringss);
        req.setHeader('Authorization', 'OAuth ' + sessionId);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        HttpResponse res = h.send(req);
        system.debug('res'+res);
        
    }
}