import { LightningElement, api, wire, track } from 'lwc';
import getallAccounts from '@salesforce/apex/getAccountdetails.getAcc';
const COLUMNS = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    {
        label: 'Action', type: 'button', typeAttributes: {
            label: 'View Contacts',
            name: 'View Contacts',
            title: 'View Contacts',
            value: 'View Contacts'
        }
    },

];
export default class AccountSearchResultchild extends LightningElement {
    @api searchText ;
    @track dataValue;
    columns = COLUMNS;

    connectedCallback() {
          console.log('this.searchtext',this.searchText); 
    }

    @wire(getallAccounts,{searchValues:'$searchText'})
    wiredContacts({ data, error }) {
        if (data) { 
            this.dataValue = data;
            console.log('ddddddtaaaaaa',JSON.stringify(data));
        }
        else if (error) {
            console.log('errrrrrrrrrrrror',JSON.stringify(error));
        }
    }

}