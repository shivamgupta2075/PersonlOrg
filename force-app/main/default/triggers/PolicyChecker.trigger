trigger PolicyChecker on Policy__c (before insert) {
    for(Policy__c p : Trigger.New){       
    if(p.Policy_Amount__c < 200000){
        EmailManager.sendMail('sg105470@gmail.com','Testing Process 2','Checking Email updates ');
    } 
    else{
             if(p.Policy_Tenure__c == '3 years' && p.Policy_Type__c == 'Health Insurance' ){
            p.Amount_after_discount__c = p.Policy_Amount__c * 0.8;
            
        }   
    else  if(p.Policy_Tenure__c== '3 years' && p.Policy_Type__c == 'Car Insurance' ){
           p.Amount_after_discount__c = p.Policy_Amount__c - (p.Policy_Amount__c * 0.7);
            
        }
    else if(p.Policy_Tenure__c== '5 years' && p.Policy_Type__c == 'Health Insurance' ){
            p.Amount_after_discount__c = p.Policy_Amount__c * 0.5;
            
        }   
    else  if(p.Policy_Tenure__c== '5 years' && p.Policy_Type__c == 'Car Insurance' ){
            p.Amount_after_discount__c = p.Policy_Amount__c * 0.4;
            
        }
        }
   
    
    }
    
        
    
    }