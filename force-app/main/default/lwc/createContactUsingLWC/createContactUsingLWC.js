import { LightningElement ,wire, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getContact from '@salesforce/apex/getContactLWC.getContact';
import getFullContact from '@salesforce/apex/getContactLWC.getFullContact';
export default class CreateContactUsingLWC extends LightningElement {   
    value = 5;
    get options() {
        return [
            { label: '5', value: '5' },
            { label: '10', value: '10' },
            { label: '15', value: '15' },
        ];
    }

    @track error; 
    @track columns;
    @track page = 1; 
    @track items = []; 
    @track dataArray = []; 
    @track startingRecord = 1;
    @track endingRecord = 0; 
    @track pageSize ;
    @track totalRecountCount = 0;
    @track totalPage = 0;
    @track searchKey;
    @track totalRecords = 0;
    @track todoTasksResponse;
    @track AllData;
    
   columns = [
        { label: 'First Name', fieldName: 'FirstName',type:"text",typeAttributes:{
            variant:"brand",
        }},
        { label: 'Last Name', fieldName: 'LastName' ,type:"text"},
        { label: 'Title', fieldName: 'Title' ,type:"text"},
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        {label: 'Select',type: 'button-icon', typeAttributes: {
                iconName:"utility:add",
                 alternativeText:"Preview",
                  title:"Preview",
                  actionName:"ADD",
                  variant:"brand"
        }}  
    ];
    @track isOpenModal = false;
 
    handleOpenModal() {
        this.isOpenModal = true;
        let style = document.createElement('style');
        style.innerText = '.slds-th__action{background-color: slategray; color:white;pointer-events: none;}';
        this.template.querySelector('lightning-datatable').appendChild(style);
    }
   
    handleCloseModal() {
        this.isOpenModal = false;
    }
    
    handleKeyChange( event ) {
       
        this.searchKey = event.target.value;
        this.displayRecordPerPage(this.page);
        
     
    }
    @wire(getContact,{searchKey: '$searchKey'})
    wiredLineItem(result) {
        this.todoTasksResponse = result;
        if(result.data) {
            //console.log('result.error==>', JSON.stringify(result.data));
            this.items = result.data;
            this.totalRecords = this.items.length;
            this.totalRecountCount = result.data.length; 
            this.pageSize = this.value;
            this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize); 
            this.dataArray = this.items.slice(0,this.pageSize); 
            this.endingRecord = this.pageSize;
           

        }else if (result.error) {
            this.error = result.error;
             this.dataArray = [];
             console.log('error');
        }
    }

    //clicking on previous button this method will be called
    handlePrev() {
        if (this.page > 1) {
            this.page = this.page - 1; //decrease page by 1
            this.displayRecordPerPage(this.page);
        }
    }

    //clicking on next button this method will be called
    handleNext() {
        if((this.page<this.totalPage) && this.page !== this.totalPage){
            this.page = this.page + 1; //increase page by 1
            this.displayRecordPerPage(this.page);            
        }             
    }

    //this method displays records page by page
    displayRecordPerPage(page){
        console.log('this.pageSize',this.pageSize);
        this.startingRecord = ((page -1) * this.pageSize) ;
        this.endingRecord = (this.pageSize * page);

        this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                            ? this.totalRecountCount : this.endingRecord; 

        this.dataArray = this.items.slice(this.startingRecord, this.endingRecord);

        this.startingRecord = this.startingRecord + 1;
    }      
    handleRowAction(event){
        const recId =  event.detail.row.Id;  
       alert('recId'+recId);    
    }
  
    handleChange(event){
        this.value = event.detail.value;
        this.pageSize = this.value;
        this.displayRecordPerPage(this.page);
     
    }
 
}