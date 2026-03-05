import { LightningElement, api, track, wire } from 'lwc';
import sayHello from '@salesforce/apex/HelloWorld.sayHello';
import conList from '@salesforce/apex/HelloWorld.conList';
export default class HelloWorld extends LightningElement {

    //hello world -- LWC variables practice
    @api recordId;
    apexMessage = '';
    error = '';
    salesforceContact;
    accId = '';
    courseName = 'Welcome to LWC Panther practice';
    objective = "We are learning Lightning Web Components in this session";
    learner = 'Mubarak';
    educator = "Panther";
    age;
    isFree = true;
    @track address = {
        hNo: '224',
        street: 'Pichu',
        city: 'panipat',
        state: 'Haryana',
        countary: 'India'
    };
    @track contactList = [
        { firstName: '', lastName: '', email: '', id: 1 },
        { firstName: '', lastName: '', email: '', id: 2 },
        { firstName: '', lastName: '', email: '', id: 3 },

    ];

    // hello World Apex call using Wire decorator

    /*  @wire(sayHello)
         apexData; //apexDat:{data: object,error:object}
      */
    @wire(sayHello)
    wiredHello({ data, error }) {
        this.apexMessage = data;
        console.error(error);
    }

    @wire(sayHello)
    wiredHello1(result) {
        //local variables - result
        const { data, error } = result; //variable deconstruction
        if (data) {
            this.apexMessage = data;
        } else if (error) {
            this.error = JSON.stringify(error);
            console.error(error);
        }
    }

    @wire(conList, {
        accId:'$accId',
        email:''
    })
    wiredCon(result) {
        const { data, error } = result; //variable deconstruction
        if (data) {
            console.log('Contact Data ', data);
          //  this.salesforceContact =data;
            this.salesforceContact =JSON.parse(JSON.stringify(data));
            this.salesforceContact.forEach(item => {
                //TODO : currentItem
                console.log(item);
                item.email ='mubarak@hulk.com';
            });
            console.log('salesforceContact data: ', this.salesforceContact);
        } else if (error) {
            this.error = JSON.stringify(error);
            console.error(error);
        }
    }
}