public with sharing class surveyResult {
    
    @AuraEnabled(cacheable=true)
    public static List<SurveyResponse>  surveyResult( ){
        
        return [SELECT Name,Status FROM SurveyResponse] ; 
    }
}