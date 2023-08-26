import { LightningElement,api } from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import Account_Type from '@salesforce/schema/Account.Type';
import Account_Industry from '@salesforce/schema/Account.Industry';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class AccountCreateRecorForm extends LightningElement {
    objectApiName = 'Account';
    @api recordId;
    fieldList = [Account_Name,Account_Type,Account_Industry];
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Account created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        
        this.dispatchEvent(evt);
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
}