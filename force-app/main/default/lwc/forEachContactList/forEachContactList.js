import { LightningElement,track } from 'lwc';
export default class ForEachContactList extends LightningElement {
@track contactList=[
  {
    "id": 2,
    "first": "Carson",
    "address":{
        "street":"tara Street",
        "city": "dublin",
        "state":"westmeath",
        "postalCode":"13354"
    },
    "last": "Gross",
   // "Picture":'https://www.google.com/imgres?q=man%20image%20passport%20size&imgurl=https%3A%2F%2Fwww.tiktok.com%2Fapi%2Fimg%2F%3FitemId%3D7550974181085646081%26location%3D3%26aid%3D1988%26index%3D1&imgrefurl=https%3A%2F%2Fwww.tiktok.com%2Fdiscover%2Fpassport-photo-prompt-for-men&docid=eWh_T-WzufxbaM&tbnid=B9WbxCQWDti33M&vet=12ahUKEwj0sNed7PaSAxUQTUEAHRvtC_cQnPAOegQIcBAB..i&w=864&h=1184&hcb=2&ved=2ahUKEwj0sNed7PaSAxUQTUEAHRvtC_cQnPAOegQIcBAB',
    "phone": "123-456-7890",
    "email": "carson@example.comz",
    "sex": 'Male'
  },
  {
    "id": 3,
    "first": "",
    "last": "",
    "phone": "",
    "email": "joe@example2.com",
    "sex": 'Male'
  },
  {
    "id": 5,
    "first": "Joe",
    "last": "Blow",
    "phone": "123-456-7890",
    "email": "joe@example.com",
    "sex": 'Female'
  },
  {
    "id": 6,
    "first": "Joe",
    "last": "Blow",
    "phone": "123-456-7890",
    "email": "joe1@example.com",
    "sex": 'Male'
  }
]
}