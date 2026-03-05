@isTest
public class AccountTriggerHandlerOneTest {
    @isTest
    private static void copyBillingToShippingInsertTest(){
        
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<2; i++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
            acc.BillingCity = 'TestCity';
            acc.BillingCountry = 'TestCountry';
            acc.BillingState = 'TestState';
            acc.BillingPostalCode = '123456';
            acc.CopyBillingAddToShipping__c = true;
            accList.add(acc);
        }
        
        Test.startTest();
        Insert accList;
        Test.stopTest();
        
        Account updateAcc =[SELECT Id,Name,ShippingCity FROM Account Where Id=:accList[0].Id];
        System.assertEquals(accList[0].BillingCity,updateAcc.ShippingCity);
    }

        @isTest
    private static void copyBillingToShippingUpdateTest(){
        
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<2; i++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
            acc.BillingCity = 'TestCity';
            acc.BillingCountry = 'TestCountry';
            acc.BillingState = 'TestState';
            acc.BillingPostalCode = '123456';
            accList.add(acc);
        }
        
        Test.startTest();
        Insert accList;
        
        for(Integer i=0; i<2; i++){
            accList[i].CopyBillingAddToShipping__c = true;
        }
        update accList;
        Test.stopTest();
        
        Account updateAcc =[SELECT Id,Name,ShippingCity FROM Account Where Id=:accList[0].Id];
        System.assertEquals(accList[0].BillingCity,updateAcc.ShippingCity);
    }
}