import { LightningElement ,api,track,wire} from 'lwc';
import getapexdata from '@salesforce/apex/GetApiData.getClothstoreData';

export default class AdvanceLWC extends LightningElement {
   

 @api recordId;
 @track jsondata;
@wire(getapexdata)
wiredContacts({ error, data }) {
    if (data) {
        this.jsondata = data;
        console.log('Data'+JSON.stringify(data));
    } else if (error) {
        console.log('Error'+error);
    }
}
  
 /* 
onclickhandler(){
    console.log('Record Data '+this.recordId);
}
@track Title  ='Title ';
@track Price ='Price ';
@track Description  ='Description';
@track Category ='Category';
@track Rating='Rating';
@track Rating ='4.5/5';
@track Rate  ='Rate ';
@track Count ='Count ';
@track Image ='https://tinypng.com/images/social/website.jpg';*/
}