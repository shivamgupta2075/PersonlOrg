import { LightningElement,api,track } from 'lwc';
import LwcLookUpController from "@salesforce/apex/LwcLookUpController.findRecords";  
export default class OpportunityTeam extends LightningElement {
   @track TeamRolePicklistValue = '';
   @track ValueUser = '';
   @track ValueOpportunityAccess ='';
    @track objectName;
    
    get TeamRolePicklist() {
        return [
            { label: 'Account Manager', value: 'Account Manager' },
            { label: 'Channel Manager', value: 'Channel Manager' },
            { label: 'Executive Sponsor	', value: 'Executive Sponsor' },
            { label: 'Lead Qualifier	', value: 'Lead Qualifier' },
            { label: 'Pre-Sales Consultant', value: 'Pre-Sales Consultant' },
            { label: 'Sales Manager	', value: 'Sales Manager' },
            { label: 'Sales Rep	', value: 'Sales Rep' },
        ];
    }

    handleChangeTeamRole(event) {
      
        this.TeamRolePicklistValue = event.detail.value;
        console.log('this.TeamRolePicklistValue'+this.TeamRolePicklistValue);
    }

    
    get optionUser() {
        return [
            { label: 'User', value: 'User' },
            { label: 'Account', value: 'Account' },
            
        ];
    }

    handleChangeUser(event) {
        this.ValueUser = event.detail.value;
        this.objectName = this.ValueUser;
        console.log('this.ValueUser'+this.ValueUser);
    }
   
    get optionOpportunityAccess() {
        return [
            { label: 'Read Only', value: 'Read Only' },
            { label: 'Read/Write', value: 'Read/Write' },
            
        ];
    }

    handleChangeOpportunityAccess(event) {
        this.ValueOpportunityAccess = event.detail.value;
        console.log('this.ValueOpportunityAccess'+this.ValueOpportunityAccess);
    }
   
}