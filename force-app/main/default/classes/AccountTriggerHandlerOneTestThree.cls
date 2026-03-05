@isTest
public class AccountTriggerHandlerOneTestThree {

    @isTest
    private static void copyBillingToShippingInsertTest(){
        
        List<Account> accList = TestUtility.createAccountRecords('Test',4,false);
        for(Integer i=0; i<4;i++){
          accList[i].BillingCity = 'TestCity';
          accList[i].BillingCountry = 'TestCountry';
          accList[i].BillingState = 'TestState';
          accList[i].BillingPostalCode = '123456';
		  accList[i].CopyBillingAddToShipping__c = true;
        }
        
        Test.startTest();
        Insert accList;
        Test.stopTest();
        
        Account updateAcc =[SELECT Id,Name,ShippingCity FROM Account Where Id=:accList[0].Id];
        System.assertEquals(accList[0].BillingCity,updateAcc.ShippingCity);
    }

        @isTest
    private static void copyBillingToShippingUpdateTest(){
        
        List<Account> accList = TestUtility.createAccountRecords('Test',4,false);
        for(Integer i=0; i<4;i++){
          accList[i].BillingCity = 'TestCity';
          accList[i].BillingCountry = 'TestCountry';
          accList[i].BillingState = 'TestState';
          accList[i].BillingPostalCode = '123456';
		  accList[i].CopyBillingAddToShipping__c = true;
        }
        
        Test.startTest();
        Insert accList;
        
        for(Integer i=0; i<4;i++){
            accList[i].CopyBillingAddToShipping__c = true;
        }
        update accList;
        Test.stopTest();
        
        Account updateAcc =[SELECT Id,Name,ShippingCity FROM Account Where Id=:accList[0].Id];
        System.assertEquals(accList[0].BillingCity,updateAcc.ShippingCity);
    }
}