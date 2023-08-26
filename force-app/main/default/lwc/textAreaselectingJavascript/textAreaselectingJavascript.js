import { LightningElement } from 'lwc';

export default class TextAreaselectingJavascript extends LightningElement {
    onchangehandler (event)
    {
        if( event.target.name == 'input3' ){
            var as  = event.target.value;
            console.log('Test',as);
        }
        
    }
    keyup(event){
        if(event.keyup == 32 || event.keyup ==  13)
        {
            alert('test');
        }
    }
    

}