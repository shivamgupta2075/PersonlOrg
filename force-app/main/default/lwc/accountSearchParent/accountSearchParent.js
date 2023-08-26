import { LightningElement } from 'lwc';
export default class AccountSearchParent extends LightningElement {


    searchText = '';
    searchaccountcontacthandler(event) {
        this.searchText = event.detail;
    }
}