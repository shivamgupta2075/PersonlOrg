import { LightningElement, track, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import csvFileRead from '@salesforce/apex/CSVFileReadLWCCntrl.csvFileRead';

const columnscontact = [
    { label: 'LastName', fieldName: 'LastName' }
    
];

export default class cSVFileReadLWC extends LightningElement {
    @api recordId;
    @track error;
    @track columnscontact = columnscontact;
    @track data;

    // accepted parameters
    get acceptedCSVFormats() {  
        return ['.csv'];

    }
    
    uploadFileHandler(event) {
        // Get the list of records from the uploaded files  
        const uploadedFiles = event.detail.files;
        
        // calling apex class csvFileread method
        csvFileRead({contentDocumentId : uploadedFiles[0].documentId, accountid : this.recordId})
        .then(result => {
            //window.console.log('result ===> '+result);
            this.data = result;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success!!',
                    message: 'Contacts are created With RecordID Account according to the CSV file upload!!!',
                    variant: 'Success',
                }),
            );
        })
        .catch(error => {
            this.error = error;
            console.log(JSON.stringify(error));
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error!!',
                    message: JSON.stringify(error),
                    variant: 'error',
                }),
            );     
        })

    }
}