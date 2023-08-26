import { LightningElement ,wire, track,api} from 'lwc';
import getContact from '@salesforce/apex/vdcommSearch.getContact';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContactList from '@salesforce/apex/vdcommSearch.getContactList';
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
    @api recordId;
    @api objectApiName = 'VDComm_Solution__c';
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
    saveDraftValues = [];
    @track isModalOpen = false;
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    submitDetails() {
        // to close modal set isModalOpen tarck value as false
        //Add your code to call apex method or do some processing
        this.isModalOpen = false;
    }
   columns = [
        { label: 'Name', fieldName: 'Name',type:"text"},
        { label: 'Total Amount', fieldName: 'Total_Amount__c' ,type:"currency",editable: true},
        { label: 'Extension Price', fieldName: 'Extension_Price__c' ,type:"currency",editable: true},
        { label: 'Total Extensions', fieldName: 'Total_Extensions__c', type: 'number' },
        { label: 'Remaining Extensions', fieldName: 'Remaining_Extensions__c', type: 'number' },
        { label: 'Used Extension ', fieldName: 'Used_Extension__c', type: 'number',editable: true },
        {label: 'Select',type: 'button-icon', typeAttributes: {
                iconName:"utility:add",
                 alternativeText:"Preview",
                  title:"Preview",
                  actionName:"ADD",
                  variant:"brand"
        }}  
    ];
   
    @wire(getContactList)
    contact;
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
    handleSave(event) {
        this.saveDraftValues = event.detail.draftValues;
        const recordInputs = this.saveDraftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            this.displayRecordPerPage(this.page);
            location.reload();
            return { fields };
            
        });
        // Updateing the records using the UiRecordAPi
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records Updated Successfully!!',
                    variant: 'success'
                })
                
            );
            this.displayRecordPerPage(this.page);
            this.saveDraftValues = [];
           
         return this.displayRecordPerPage(this.page);  
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'An Error Occured!!',
                    variant: 'error'
                })
            );
        }).finally(() => {
            this.saveDraftValues = [];
        });
    }

@track fields = ['Name', 'Total_Amount__c', 'Extension_Price__c', 'Used_Extension__c'];
    
}