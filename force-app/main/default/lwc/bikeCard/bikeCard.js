import { LightningElement } from 'lwc';
import getFullContact from '@salesforce/apex/wrapperClssData.getBlogs';
export default class BikeCard extends LightningElement {
   name = 'Electra X4';
   description = 'A sweet bike built for comfort.';
   category = 'Mountain';
   material = 'Steel';
   price = '$2,700';
  // pictureUrl = 'https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';



   tesing(){
    getFullContact()
    .then(result =>{
        console.log(JSON.stringify(result));
    })
    .catch(error =>{
        this.errorMsg = error;
    })
}
   }