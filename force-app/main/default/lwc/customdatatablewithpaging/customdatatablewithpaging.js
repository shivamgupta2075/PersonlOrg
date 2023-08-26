import { LightningElement,api } from 'lwc';
import getApexcall from '@salesforce/apex/returnAccount.allaccounts';
export default class Customdatatablewithpaging extends LightningElement {

@api RecordId;

connectedCallback() {
this.callApexclass();
}

callApexclass(){
getApexcall()
        .then(result => {
            console.log('object'+JSON.stringify(result));
        })
        .catch(error => {
            this.error = error;
        });
}
}