public class DMLDemo {
    
    public static void databaseClassDemo(){
        
        List<Contact> conList = new List<Contact>{
        new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
             new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
             new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
            new Contact()};
                
                // insert conList;  //DML Statement
             Database.SaveResult[] srList = Database.insert(conList,false);
        // Iterate through each returned result
        for (Database.SaveResult sr : srList){
            if (sr.isSuccess()) {
                //Opperation was successful, so get the Id of the record that was processed
            	System.debug('Successfully inserted contact. Contact ID: '+ sr.getId());
            } else {
                //Operation failed, so get all the errors
                for(Database.Error err : sr.getErrors()){
                    System.debug('Following Error has occured, Please Check');
                    System.debug(err.getStatusCode()+ ':'+ err.getMessage());
                    System.debug('Contact fields that affected this error: '+ err.getFields());
                }
            }
        }
    }
    
        Public Static Void unDeleteDemo(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Rating,Industry from Account WHERE Name Like 'Upsert DML %' ALL ROWS];
        if(!accList.isEmpty()){
            undelete accList;
        }    
    }
    
    Public Static Void deleteDemo(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Rating,Industry from Account WHERE Name Like 'Upsert DML %'];
        if(!accList.isEmpty()){
            Delete accList;
        }    
    }
    
    Public Static void upsertDemo(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Rating,Industry from Account WHERE Rating='Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Industry ='Energy';
            }            
        }
        update accList;
        
        try{
            for(Integer i=1; i<=5; i++){
            Account acc = new Account();
            acc.Name = 'Upsert DML '+ i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        }
        catch(DMLException e){
            System.debug(e);
        }
        
        if(!accList.isEmpty()){
            insert accList;
        }
    }
    
    Public Static void updateDemo(){
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Name,Rating,Industry from Account WHERE Rating='Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Industry ='Media';
            }
            update accList;
        }
    }
    
    Public static void insertDemoWithLoop(){
        List<Account> accList = new List<Account>();
        for(Integer i=1; i<=15; i++){
            Account acc = new Account();
            acc.Name = 'Test DML '+ i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Insert accList;
    }
    
    Public static void insertDemo(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test DML 104';
        acc.Active__c = 'Yes';
        accList.add(acc);
        
        //  System.debug('Account Id= '+ acc.Id);
        Account acc1 = new Account();
        acc1.Name = 'Test DML 105';
        acc1.Active__c = 'Yes';
        accList.add(acc1);
        
        Insert accList;
    }
    
    
    Public static void insertRelatedObjectDemo(){
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Account acc = new Account();
        acc.Name = 'Test DML 106';
        acc.Active__c = 'Yes';
        accList.add(acc);
        
        //  System.debug('Account Id= '+ acc.Id);
        
        Account acc1 = new Account();
        acc1.Name = 'Test DML 107';
        acc1.Active__c = 'Yes';
        accList.add(acc1);
        
        Insert accList;
        
        Contact con = new Contact();
        con.FirstName = acc.Name;
        con.LastName = acc.Name;
        con.AccountId = accList[0].Id;
        conList.add(con);
        
        Contact con1 = new Contact();
        con1.FirstName = acc1.Name;
        con1.LastName = acc1.Name;
        con1.AccountId = accList[1].Id;
        conList.add(con1);
        
        Insert conList;
    }
}