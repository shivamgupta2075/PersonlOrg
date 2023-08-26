public with sharing class getNameList{
@AuraEnabled

public static SearchField__c saveAccount (SearchField__c acc) {

insert acc;
return acc;
}
}