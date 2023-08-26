import { LightningElement,track,wire } from 'lwc';
import getAcc  from '@salesforce/apex/creatingPlaceorderApex.getAcc';

export default class CreatingPlaceOrder extends LightningElement {
    @track name;
    @track boolean = false;
    
    handleClick(event){
        alert('d');
        this.boolean = true;
        var fname=this.template.querySelector("lightning-input").value;
        this.name = fname;
        console.log(this.name);
        this.findaccounts();
        
    }
    findaccounts(){
        getAcc({
            searchKey : this.name
	    })
        .then(result =>{
            console.log('Result----'+JSON.stringify(result));
               
        })
        .catch(error=>{
                
                console.log('Error ----'+error);
        });
    }


}