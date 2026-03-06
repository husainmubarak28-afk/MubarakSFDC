import { LightningElement } from 'lwc';

export default class Parent extends LightningElement {
    messageToSend = '';

    handleChange(event) {
        this.messageToSend = event.target.value;
    }
}