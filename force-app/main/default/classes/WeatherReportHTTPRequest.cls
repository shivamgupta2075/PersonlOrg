public with sharing class WeatherReportHTTPRequest {

public static string getRequestToken() {
    string cKey = '3MVG9VeAQy5y3BQWsyqH8W.Cg6eDkA28jxf.5JNHE1cbhYqyKCMMSzRFMWmVulozfQOTrSC7pPul4YAJNfFLg';
    string cSecret = '4732702A739C1579E4C683089415522C6D69ADDD451B68B4887D7C23F6D814C3';
    string uName = 'sg105470@gmail.com';
    string passwd = 'shivam80001NdS56NzuT8WWJCiLgdMmH7Gq';
        string reqBody = 'grant_type=password&client_id=' + cKey + '&client_secret=' + cSecret + '&username=' + uName + '&password=' + passwd;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('POST');
        req.setEndpoint('https://grazittiinteractive42-dev-ed.my.salesforce.com/services/oauth2/token');
        HttpResponse hresp = h.send(req);
    system.debug('hresp'+hresp);
        responseWrapper wResp = (responseWrapper) JSON.deserialize(hresp.getBody(), responseWrapper.class);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        return wResp.access_token;
    }
     public class responseWrapper {
        public string id;
        public string access_token;
        public string instance_url;
    }
    @future(callout = true)
    public static void updateOppty() {
            String accToken;
            string responseBody;
            string endPoint = '';

            DatedConversionRate obj = new DatedConversionRate();
            HTTP http = new HTTP();
            HTTPRequest request = new HTTPRequest(); 
            request.setEndpoint(system.label.DatedConversionRateUrl);
            request.setMethod('GET');
            HTTPResponse response = http.send(request);
            system.debug('access token' + accToken);
            if (accToken != '') {
                Http h1 = new Http();
                HttpRequest req1 = new HttpRequest();
                req1.setHeader('Authorization', 'Bearer ' + accToken);
                req1.setHeader('Content-Type', 'application/json');
                req1.setBody(JSON.serialize(response.getBody()));
                req1.setMethod('PUT');
                req1.setEndpoint(endPoint);
             //   HttpResponse hresp1 = h1.send(req1);
                system.debug('hresp1'+req1);
                //listWrap=(list<resultWrapper>) JSON.deserialize(hresp1.getBody(),list<resultWrapper>.class);
            }
        }
    
}