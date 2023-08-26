import { LightningElement } from 'lwc';
export default class AccountSearchForm extends LightningElement {
    searchtext = ' ';
    handleonchangeaccount(event) {
        this.searchtext = event.target.value;
    }
    handleonClicksearchbutton() {
        //declartive approch
        const event = new CustomEvent('searchaccountcontact', { detail: this.searchtext });
        this.dispatchEvent(event);
    }
}