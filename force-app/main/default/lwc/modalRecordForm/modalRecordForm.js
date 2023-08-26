import { LightningElement ,api, track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ModalRecordForm extends LightningElement {  
objectApiName = 'Account';
@api RecordId;
    handlesuccess(event) {
        event.preventDefault(); // stop the form from submitting
        const fields = event.detail.fields;
        var selectElement =  this.template.querySelector('lightning-input_input[name="ShippingStreet"]');
     
        console.log(JSON.stringify(selectElement));
    }



}