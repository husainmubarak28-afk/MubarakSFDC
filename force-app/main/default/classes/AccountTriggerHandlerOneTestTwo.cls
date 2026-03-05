@isTest
public class AccountTriggerHandlerOneTestTwo {

    @testSetup
    private static void dataSetup(){
        
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<2; i++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
            acc.BillingCity = 'TestCity';
            acc.BillingCountry = 'TestCountry';
            acc.BillingState = 'TestState';
            acc.BillingPostalCode = '123456';
            if(i==0){
            acc.CopyBillingAddToShipping__c = true;     
            }
           
            accList.add(acc);
        }
        Insert accList;
 
    }
    

    @isTest
    private static void copyBillingToShippingUpdateTest(){
        Account acc = [SELECT Id,BillingCity,CopyBillingAddToShipping__c FROM Account WHERE Name ='Test1' LIMIT 1];
        
        Test.startTest();
        acc.CopyBillingAddToShipping__c = true;
        update acc;
        Test.stopTest();
        
        Account updateAcc =[SELECT Id,Name,ShippingCity FROM Account Where Id=:acc.Id];
        System.assertEquals(acc.BillingCity,updateAcc.ShippingCity);
    }
    
}