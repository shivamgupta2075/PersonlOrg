import { LightningElement,api, wire, track } from 'lwc';
import getOpportunityListItem  from '@salesforce/apex/create_standard_OLI.getOpps';
import saveAccounts  from '@salesforce/apex/create_standard_OLI.saveAccounts';
export default class Create_standard_OLI extends LightningElement {
    
    @track isModalOpen = false;
   
    data = [];
    @track productEntry = false;
    @track disableBtn = true;
    @track columns = [{
        label: 'Product Name',
        fieldName: 'Name',
        type: 'text',
        
    },
    {
        label: 'Product Code',
        fieldName: 'ProductCode',
        type: 'text',
   
    },
    {
        label: 'List Price',
        fieldName: 'UnitPrice',
        type: 'currency',
       
    },
     {
        label: 'Product Discription',
        fieldName: 'product2.Description',
        type: 'text',
        
    },
      {
        label: 'Product Family',
        fieldName: 'product2.family ',
        type: 'text',
        
    }
   
];
@api searchKey = '';
handleKeyChange( event ) {
    this.searchKey = event.target.value;
}
@track storedata = '';

@track error;
@wire(getOpportunityListItem , {searchKey: '$searchKey'})
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.product = data;
            this.storedata = this.product;

        } else if (error) {
            this.error = error;
        }
    }
    @track allcheckedValues ;
    @track checkedList;
    @track keyIndex;
    @track index;
    @track setRows = [];
    handlerowaction(event)
    {
        const selectedRows = event.detail.selectedRows;
        this.checkedList = selectedRows.length;
        this.hideNext = false;
        this.setRows = [...selectedRows];
        console.log('this.setRows'+ JSON.stringify(this.setRows));  
    }
    
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
        this.clickedButtonLabel = 'Next';
        this.backdisabled = true;
        this.hideNext = true;
        this.checkedList =0;
        this.product = this.storedata;
    
            //Add your code to call apex method or do some processing
    
    }   
    handleaddProduct()
    {
        this.isModalOpen = true;
    }
    @track clickedButtonLabel = 'Next';  
    @track boolVisible = false;  
    @track hideNext = true;
    @track backdisabled = true;
    handleBack(){
                this.product = this.storedata;
                this.boolVisible = false;  
                this.oliList = '';
                this.clickedButtonLabel = 'Next';
                this.checkedList = 0;
                this.backdisabled = true;
                this.hideNext = true;
    }
  
    
 
    handleNext(event) {  
        const label = event.target.label;  
        
        if ( label === 'Next' ) {  
  
            this.clickedButtonLabel = 'Save';  
            this.boolVisible = true;  
            this.product = false;
            this.backdisabled = false;
            this.oliList =[];
            for (let i = 0; i < this.setRows.length ; i++){
            this.oliList.push({
                 Product:this.setRows[i].Name,
                 Quantity:'',
                 SalesPrice:this.setRows[i].UnitPrice,
                 Date:'',
                 LineDescription:''
             });
            
             }  
             
        } else if  ( label === 'Save' ) {  
           console.log(this.oliList.length);
           console.log('checingLiat',JSON.stringify(this.oliList));
        saveAccounts({ accountList : this.oliList })
            .then(result => {
                this.message = result;
                this.error = undefined;                
                this.oliList.forEach(function(oli){                   
                        oli.Product='',
                        oli.Quantity='',
                        oli.SalesPrice='',
                        oli.Date='',
                        oli.LineDescription=''  
                                      
                });

                //this.opportunityRecList = [];
                if(this.message !== undefined) {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Accounts Created!',
                            variant: 'success',
                        }),
                    );
                }
                
                console.log(JSON.stringify(result));
                console.log("result", this.message);
            })
            .catch(error => {
                this.message = undefined;
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating records',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });

  
        }  
    }  
    deleteRow(event){
        if(this.oliList.length>=1){             
            this.oliList.splice(event.target.accessKey,1);
            this.keyIndex-1;
       }
    }
    handleinput(event){
        if(event.target.name === 'Product')
        {
            console.log('product');
            console.log('accessKey',event.target.accessKey);
            this.oliList[event.target.accessKey].Product = event.target.value;
        }
      else if(event.target.name === 'Quantity')
        {
            console.log('Quantity');
            console.log('accessKey',event.target.accessKey);
            this.oliList[event.target.accessKey].Quantity = event.target.value;
        }
        else if(event.target.name === 'SalesPrice')
        {
            console.log('accessKey',event.target.accessKey);
            this.oliList[event.target.accessKey].SalesPrice = event.target.value;
        }
        else  if(event.target.name === 'Product')
        {
            console.log('accessKey',event.target.accessKey);
            this.oliList[event.target.accessKey].Product = event.target.value;
        }
        else if (event.target.name === 'LineDescription')
        {
            console.log('accessKey',this.accessKey);
            this.oliList[event.target.accessKey].LineDescription = event.target.value;
        }
    }
@track oliList = [
    {
        Product:'',
        Quantity:'',
        SalesPrice:'',
        Date:'',
        LineDescription:''
    }
];

    
}