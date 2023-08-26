import { LightningElement,track,wire,api } from 'lwc';  
import pickListValueDynamically from '@salesforce/apex/opportunityTeamMember.pickListValueDynamically';

export default class ModalPopupLWC extends LightningElement {
    //Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
    @track isModalOpen = false;
    @track keyIndex = 0;  
    @track error;
    @track message;
    @track opportunityRecList = [
        {                      
            TeamRole: '',
            User: '',
            OpportunityAccess: ''
        }
    ];
    @track picklistVal;
    //Add Row 
    addRow() {
        this.keyIndex+1;   
        this.opportunityRecList.push ({            
            TeamRole: '',
            User: '',
            OpportunityAccess: ''
        });
        console.log('Enter ',this.opportunityRecList);
        
    }
    changeHandler(event){       
       // alert(event.target.id.split('-'));
        console.log('Access key:'+event.target.accessKey);
        console.log('id:'+event.target.id);
        console.log('value:'+event.target.value);       
        if(event.target.name==='TeamRole')
            this.opportunityRecList[event.target.accessKey].TeamRole = event.target.value;
        else if(event.target.name==='User'){
            this.opportunityRecList[event.target.accessKey].User = event.detail;
            console.log('jdfjsdhfvshvfhvdfhvdjfvd',event.target.value);
        }
        else if(event.target.name==='OpportunityAccess'){
            this.opportunityRecList[event.target.accessKey].OpportunityAccess = event.target.value;
        }
    } 
    
    //Save Accounts
     saveMultipleAccounts() {

        console.log("accountlist"+JSON.stringify(this.opportunityRecList));
        saveAccounts({ accountList : this.opportunityRecList })
            .then(result => {
                this.message = result;
                this.error = undefined;                
                this.opportunityRecList.forEach(function(item){                   
                    item.TeamRole='';
                    item.User='';
                    item.OpportunityAccess='';    
                                      
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
    removeRow(event){       
        console.log('Access key2:'+event.target.accessKey);
        console.log(event.target.id.split('-')[0]);
        if(this.opportunityRecList.length>=1){             
             this.opportunityRecList.splice(event.target.accessKey,1);
             this.keyIndex-1;
        }
    }  
 
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
    @wire(pickListValueDynamically, {customObjInfo: {'sobjectType' : 'OpportunityTeamMember'},
    selectPicklistApi: 'TeamMemberRole'}) selectTargetValues;
 

    @wire(pickListValueDynamically, {customObjInfo: {'sobjectType' : 'OpportunityTeamMember'},
    selectPicklistApi: 'OpportunityAccessLevel'}) selectTReadAndWrite;
 
    }