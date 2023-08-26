import { LightningElement,api, wire, track } from 'lwc';
import getOpportunity from '@salesforce/apex/PaginationApex.getAllOpp';


export default class PaginationInLwc extends LightningElement {

@track columns = [
    { label: 'Account Name ', fieldName: 'Account.Name',type: 'text' },
    { label: 'Opportunity Name', fieldName: 'Name',type: 'text'},
    { label: 'Phone', fieldName: 'Account.Phone', type: 'phone' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    
];
@track accListOld; 
@track accList; 
@wire(getOpportunity) 
wiredAccount({ error, data }) {
        if (data) {
            this.accList = data;
          this.accListOld = data; 
          this.getdata( JSON.stringify(data));
          // console.log('error'+JSON.stringify(data)); 
          
        } else if (error) {
           console.log('error'+error); 
        }
    }

     getdata = (test)=>{
      console.log(test.Account.Name); 
      
   }
    
}