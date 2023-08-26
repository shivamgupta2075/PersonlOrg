import { LightningElement } from 'lwc';

export default class Createcustomdropdown extends LightningElement {
    changeHandler(event){
       const field = event.target.value;
       console.log('fields'+field);
    }
}