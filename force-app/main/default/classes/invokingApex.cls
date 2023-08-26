Public class invokingApex {
@InvocableMethod 
Public static void getAccountDetails (list<account> acc){
System.debug('getAccountList' + acc);
list<contact> conList =  new list<contact>();
for(account it:acc){
System.debug(it.NumberofLocations__c);
for(decimal i=0; i<it.NumberofLocations__c;i++)
{
contact con = new contact();
con.accountId = it.id;
con.lastName = it.name +i;
conList.add(con);
}}insert conList;
}}