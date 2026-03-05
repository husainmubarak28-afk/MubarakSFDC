public class UpdateAccounts {
    public static void updateAccount(){
        List<Account> accListToUpdate = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Contact con : [SELECT Id,FirstName,Account.Id FROM Contact WHERE Name LIKE '%Test%' AND Account.Id != NULL]){
            if(!accIds.contains(con.Account.Id)){
                Account acc = new Account();
                acc.Id = con.Account.Id;
                acc.Active__c = 'Yes';
            	acc.Rating = 'Hot';
                accListToUpdate.add(acc);
                accIds.add(con.Account.Id);
            }
        }
        if(!accListToUpdate.isEmpty()){
            update accListToUpdate;
        }
    }
}