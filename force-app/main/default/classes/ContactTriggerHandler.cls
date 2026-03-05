public class ContactTriggerHandler {

    Public static void totalContactCount(List<Contact> conList){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Contact con: conList){
            if(con.AccountId != null){
                //Collect all the Account Ids
                accIds.add(con.AccountId);
            }
        }
        
        for(Account acc:[SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE ID IN: accIds]){
            acc.Total_Contact_Count__c = acc.Contacts.size();
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}