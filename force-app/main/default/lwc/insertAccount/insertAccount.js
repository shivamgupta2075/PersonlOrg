import { LightningElement, track} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import Account_number from '@salesforce/schema/Account.AccountNumber';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import insertAccount from '@salesforce/apex/lwcController.insertAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class InsertAccount extends LightningElement {
@track error;
@track theRecord = [{
    Name : NAME_FIELD,
    AccountNumber : Account_number,
    PhoneNumber : PHONE_FIELD
}];
handleAccount(event){

    if( event.target.name == 'Name' ){
        this.theRecord[0].Name = event.target.value;  
    }
    if( event.target.name == 'AccountNumber' ){
        this.theRecord[0].AccountNumber = event.target.value;
    }
    if( event.target.name == 'PhoneNumber' ){
        this.theRecord[0].PhoneNumber = event.target.value;
    }  
} 
saveAccountAction(event){
console.log('99');
console.log(JSON.stringify(this.theRecord));
console.log('1'+JSON.parse(JSON.stringify(this.theRecord)));
console.log('2'+this.theRecord);
        insertAccount({
           accountObj: this.theRecord
        })
    .then(result => {
        window.console.log('result ===> '+result);
        // Show success messsage
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success!!',
            message: 'Account Created Successfully!!',
            variant: 'success'
        }),);
        this.template.querySelectorAll('lightning-input').forEach(each => {each.value = '';});
    })
    
    .catch(error => {
        this.error = error.message;
    });
}
}