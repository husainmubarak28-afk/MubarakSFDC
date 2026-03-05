import { LightningElement } from 'lwc';
import getMessage from '@salesforce/apex/accountController.getMessage';

export default class ImperativeExample extends LightningElement {

    message;

    handleClick() {
        getMessage()
            .then(result => {
                this.message = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}