public with sharing class newsAppController {
    @Auraenabled(cacheable=true)
    public static Map<String , Object> retriveNews() {
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8b873898c99641e9bc5dc38f0160b9ba');
        httpRequest.setMethod('GET');
        Map<String, Object> newJsonData = new Map<String, Object>();
        String strResponse  = null;

        try {
            Http http = new Http();
            HttpResponse httpResponse = http.send(httpRequest);
            if (httpResponse.getStatusCode() == 200) {
                strResponse = httpResponse.getBody();
            }
            else {
                throw new CalloutException (httpResponse.getBody());
            }
        } 
        catch (Exception e) {
            throw e;

            
        }
if(!String.isBlank(strResponse)){
    newJsonData = (Map<String, Object>)JSON.deserializeUntyped(strResponse);
}
if (!newJsonData.isEmpty()) {
    return newJsonData;
}
else{
    return null;
}
    }
}