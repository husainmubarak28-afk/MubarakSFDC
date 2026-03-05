public class AccountTriggerHandler {
    public static void updateDesc(List<Account> accList){
        for(Account acc: accList){ 				
                acc.Description = 'Account is created';
        }
    }
    
    public static void populateRating(List<Account> accList,Map<Id,Account> accOldMap){
        for(Account acc: accList){
            if ((accOldMap == null && acc.Industry != null && acc.Industry =='Media')
            || (acc.Industry != null && acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry =='Media')){
                acc.Rating ='Hot';
            }
        }
    }
    
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Account acc:accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            Database.SaveResult[] srList= Database.insert(oppList,false);
            for(Integer i=0;i<srList.size();i++){
                if(!srList[i].isSuccess()){
                    String errors='';
                    for(Database.Error err: srList[i].getErrors()){
                        errors=errors+err.getMessage();
                    }
                    accList[i].addError(errors);
                }
            }
        }
    }
    
    public static void updatePhone(List<Account> accList, Map<Id,Account> accOldMap){
        for(Account acc: accList){
            if (acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description = 'Phone number is Updated| Old Value= '+accOldMap.get(acc.Id).Phone+' New Value= '+acc.Phone;
            }
        }  
    }
    
    public static void updateRelatedContact(List<Account> accList, Map<Id,Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        for(Account acc: accList){
            //Map will store only those accounts whose phone is updated
            if(Acc.Phone != accOldMap.get(acc.id).Phone){
                accMap.put(acc.Id,acc);
            }
        }
        for(Contact con: [SELECT Id,HomePhone,AccountId FROM Contact WHERE AccountId IN : accMap.keySet()]){
            if (accMap.containsKey(con.AccountId)){
                con.HomePhone = accMap.get(con.AccountId).Phone;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    public static void updateRelatedContactWithSOQL(List<Account> accList, Map<Id,Account> accOldMap){
        List<Contact> conList = new List<Contact>();
       // Map<Id,Account> accMap = new Map<Id,Account>();
        Set<Id> accIds = new Set<Id>();
        
        for(Account acc: accList){
            if(Acc.Phone != accOldMap.get(acc.id).Phone){
           		accIds.add(acc.Id);
            }
        }
        
        for(Account acc: [SELECT Id,Phone, (SELECT HomePhone FROM Contacts) FROM Account WHERE Id IN: accIds]){
            if(acc.Contacts != null){
                for(Contact con: acc.Contacts){
                    con.HomePhone = acc.Phone;
                    conList.add(con);
                }
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    
    Public static void preventDeletion(List<Account> accList){
        Profile p=[SELECT Id from Profile WHERE Name='System Administrator'];
        for(Account acc:accList){
            if(UserInfo.getUserId() !=p.Id || acc.Active__c == 'Yes'){
                acc.addError(Label.Prevent_Account_Deletion);
            }
        }
    }
    
    public Static void updateAccount(List<Account> accList, Map<Id,Account> accOldMap){
        
        List<Account> accToBeUpdated = new List<Account>();
        for(Account acc:accList){
            Account a = new Account();
            a.id= acc.Id;
            a.Description = 'Test Recursion';
            accToBeUpdated.add(a);
        }
        if(!accToBeUpdated.isEmpty()){
           Update accToBeUpdated;
        }
    }
    
    public static Boolean handleAccount(List<Account> accList){
        
        if(Trigger.isExecuting){
            // Do whatever you want to do as a part of the Trigger invocation
            System.debug('Trigger is Executing: ' + Trigger.isExecuting);
        }else{
            // Do whatever you want to do if the call originated from different context
            System.debug('Without Trigger');
        }
        return Trigger.isExecuting;
    }
}