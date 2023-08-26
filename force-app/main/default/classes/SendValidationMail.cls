public class SendValidationMail {
 /*   public static void test(List<string> str){
        List<Account> allAcc = new List<Account>();
        List<String> validationErrors = new List<String>();
        for(account acc : [Select id,Account_Type__c from Account where Id IN: str]){
            if(acc != null){
                acc.Account_Type__c =  'Prospect';
                allAcc.add(acc);
                
            }
        }
        system.debug('allAcc'+allAcc);
        List<Database.SaveResult> updateResults = Database.update(allAcc,false);
        system.debug('updateResults'+updateResults);
        for(Integer i=0;i<updateResults.size();i++){
            if (!updateResults.get(i).isSuccess()){
                // DML operation failed
                Database.Error error = updateResults.get(i).getErrors().get(0);
                String errorMessage = error.getMessage();
                String oppId = allAcc.get(i).Id;
                if (errorMessage.startsWith('FIELD_CUSTOM_VALIDATION_EXCEPTION,')) {
                    String validationRuleName = errorMessage.split(':')[0].substring('FIELD_CUSTOM_VALIDATION_EXCEPTION,'.length());
                    validationErrors.add('Opportunity ' + oppId + ' could not be updated due to validation rule ' + validationRuleName + ': ' + errorMessage.split(':')[1]);
                } else {
                    validationErrors.add('Opportunity ' + oppId + ' could not be updated: ' + errorMessage);
                }
            }
        }
        if (!validationErrors.isEmpty()) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] { 'sg105470@gmail.com' };
                mail.setToAddresses(toAddresses);
            mail.setSubject('Validation Errors on Opportunities Current Exchange Rate Not Get Updated');
            mail.setPlainTextBody(String.join(validationErrors, '\n'));
            Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
        
    }*/
}