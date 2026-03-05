@isTest
public class UpdateAccountsTest {
    @isTest
    private static void testUpdateAccount(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Active__c = 'Yes';
        acc.Rating = 'Cold';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Test';
        con.AccountId = acc.id;
        insert con;
        
        UpdateAccounts.updateAccount();
        
        Account updateAcc=[SELECT Id,Active__c,Rating FROM Account WHERE Id =: acc.Id];
        System.assertEquals('Hot',updateAcc.Rating);
           
           }
}