public class sobjectWithField {

    @AuraEnabled
    public static List<string> getAllObjects(){
List<string> SObjectList = new List<string>();

for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
   String name = objTyp.getDescribe().getName();
   // Exclude all the unwanted Sobjects e.g. History, Share etc..

 if(!name.containsignorecase('history') && !name.containsignorecase('tag')&&
    !name.containsignorecase('share') && !name.containsignorecase('feed')){      
      SobjectList.add(name);
      System.debug( 'Name : ' + name);
  }

}
        return SObjectList;
}
     @AuraEnabled
    public static List<String> getAllFields(String fld){
        List<String> fieldList = new List<String>();
Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
Schema.SObjectType sobjType = gd.get(fld); 
Schema.DescribeSObjectResult describeResult = sobjType.getDescribe(); 
Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap(); 
    for(string str: fieldsMap.keySet()){
				fieldList.add(fieldsMap.get(str).getDescribe().getName());                
            }
    return fieldList; 
        
        
}	
  @AuraEnabled
   public static string getQueries(string objectName , list<string> fieldName ){
      
		String query =(' SELECT '+String.join( fieldName, ',' )+' FROM '  +objectName);
     
      List<SObject> listData = Database.query(query);
        system.debug(query);
	    System.debug( listData);
 
       		
        return null;
      }
    

          
}