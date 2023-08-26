import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class RecordFormCreateExample extends LightningElement {
    // objectApiName is "Account" when this component is placed on an account record page
    @api objectApiName = 'Account';

    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];
    create = false;

    handleCreate(event) {
        this.create = true;
    }
    update = false;
    handleUpdate(event) {
        this.update = true;
    }
    handleReset(event) {
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                if(field.name === "Name") {
                    field.reset();
                }
                else if(field.name === "AnnualRevenue") {
                    field.reset();
                }
                else if(field.name === "Industry") {
                    field.reset();
                }
            });
        }
    }
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Account created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}