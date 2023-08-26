public with sharing class GetApiData {
    
    @AuraEnabled(cacheable=true)
    public static List<WrapperClass> getClothstoreData(){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://fakestoreapi.com/products');
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        System.debug('test'+resp.getBody()); 
		return (List<WrapperClass>) System.JSON.deserialize(resp.getBody(), List<WrapperClass>.class);
        
    }
    
    public class WrapperClass {

	 @AuraEnabled  public integer id;
	 @AuraEnabled  public String title;
	 @AuraEnabled  public Double price;
	 @AuraEnabled  public String description;
	 @AuraEnabled  public String category;
	 @AuraEnabled  public String image;
	 @AuraEnabled  public Rating rating;
	/*public static List<JSON2Apex> parse(String json) {
		return (List<JSON2Apex>) System.JSON.deserialize(json, List<JSON2Apex>.class);
	}*/
}
    public class Rating {
		 @AuraEnabled  public Double rate;
		 @AuraEnabled  public Integer count;
	}
   
}