import { LightningElement,api } from 'lwc';

export default class OpportunityTeamComponent extends LightningElement {
    @api object = 'chek';
    @api indexData = [ {index : 1} ,{index : 2} , {index :3}, {index : 4} ,{index : 5}  ];

    handleSave( event){
        console.log('object'+this.object);
    }
}