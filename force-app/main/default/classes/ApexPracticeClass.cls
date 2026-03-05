public class ApexPracticeClass {
    public void demoList(){
        List<String> strList = new List<String>();
        strList.add('Black');
        strList.add('Green');
        List<String> strList2 = new List<String>();
        strList2 = strList.clone();
    }
    
    Public void sObjectListDemo(){
        List<Account> accList = new List<Account>();
        Account acc = new Account(Name ='AccTest 1', Active__c = 'Yes');
        accList.add(acc);
        
        Account acc2 = new Account();
        acc2.Name ='AccTest 2';
        acc2.Active__c ='Yes';
        accList.add(acc2);
        insert accList;
    }
    
    public void demoSObject(){
        object obj;
        obj = new Account(Name ='AccGenericTest 3', Active__c = 'Yes');
        Account acc= (Account)obj;
    	System.debug('Account =>' + acc);
        
       obj = new Position__c (Name='GenericDev');
        Position__c pos= (Position__c)obj;
        System.debug('Positions =>' + pos);
        
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        accList = [SELECT Id,Name FROM Account LIMIT 2];
        Map<Id,Account> accMap = new Map<Id,Account>(accList);
        
        if(!accList.isEmpty()){
         for(Account accL:accList){  //istead of accList here you can directly use SOQL query : [SELECT Id,Name FROM Account LIMIT 2]
            accIds.add(accL.Id);
        }   
        }
        if(!accIds.isEmpty()){
            for(Id i : accIds){
                if(accMap.containsKey(i)){
                    System.debug('Map Values =>' + accMap.get(i));
                }
              // System.debug('accIds=>'+ accIds); 
        
            }
        } 
    }
    
    Public void DMLDemo(){
        
        //Insert DML
        List<Account> accList = new List<Account>();
        Account acc1 = new Account(Name='Test Acc1',Phone='2345332');
        Account acc2 = new Account(Name='Test Acc2',Phone='23433332');
        accList.add(acc1);
        accList.add(acc2);
        insert accList;
        
        Account acc3 = new Account(Name='Test Acc3',Phone='23325332');
        insert acc3;
        Contact con = new Contact(FirstName='Husain',LastName='Mubarak',AccountId=acc3.id);
        insert con;
        
        //Update DML
        Account acc=[SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc1'];
        System.debug('Account=>'+ acc);
        acc.Phone='8764573';
        update acc;
        Account UpdatedAcc=[SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc1'];
        System.assertEquals(updatedAcc.Phone,acc.Phone,'Equal');
        
        Contact con1=[SELECT Id,FirstName,LastName,Phone,Account.Phone FROM Contact WHERE FirstName='Husain' AND LastName='Mubarak' AND AccountId!=null];
        con1.Phone='1234567';
        con1.Account.Phone ='113234';
        update con1;
        update con1.Account;
        
        //Upsert DML
        List<Account> accList1 = new List<Account>();
        Account acc4 = new Account(Name='Test Acc4',Phone='5332');
        Account acc5= [SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc3'];
        acc5.Phone='09876';
        accList1.add(acc4);
        accList1.add(acc5);
        upsert accList1;
        
        //Merge DML Only Lead,Account and Contact Object records can be merged, We can merge upto 3 records of same sObject type.
         Account MainAcc=[SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc2'];
         Account DupAcc=[SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc4'];
        Merge MainAcc DupAcc;
        
        //Delete DML
        List<Account> accList2 = [SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc4'];
        delete accList2;
        
        //UnDelete DML
        List<Account> deletedAcc = [SELECT Id,Name,Phone FROM Account WHERE Name ='Test Acc4' ALL ROWS];
        undelete deletedAcc;
        
        //DML Exception DMLs
        try{
            Account acc6=new Account();
        }
        catch(DMLException e){
            System.debug('Error=>' + e.getMessage());
        }
    }
    //SOQLs
    Public void SOQLDemo(){
        //INSERT SOQL
    Account accA = new Account(Name='SGTS',Active__c='Yes',Phone='123456');
    insert accA;
    Contact conC = new Contact(FirstName='Jackson',LastName='Perry',AccountId=accA.Id,Phone='123456');
    insert conC;
        //UPDATE SOQL
        Contact conS=[SELECT Id,Name,Account.Phone,Phone FROM Contact WHERE LastName='Perry'];
        conS.Phone='235689';
        conS.Account.Phone='457890';
        update conS;
        update conS.Account;
        
        //Parent to Child SOQL - Standard Object - Account & Contact
        List<Account> accList=new List<Account>();
        accList =[SELECT Id,Name,(SELECT Id,Name FROM Contacts) FROM Account WHERE Name='SGTS'];
        System.debug('Account List=>'+ accList);
        if(!accList.isEmpty()){
            for(Account acc:accList){
                System.debug('Contacts List=>'+ acc.Contacts);
                for (Contact con:acc.Contacts){}
            }
        }
        
    }
    
    //SOSL Demo
    Public void SOSLDemo(){
        List<List<sObject>> searchList=[FIND 'Mubarak' IN ALL FIELDS RETURNING Account(Name),Contact(FIRSTName,LastName,Email LIMIT 2)];
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        
        accList =(List<Account>) searchList[0];
        conList=(List<Contact>) SearchList[1];
        
        for(Account acc:accList){
            System.debug('Name'+ acc.Name);
        }
        for(Contact con:conList){
            System.debug(con.FirstName+' '+con.LastName);
        }
    }
}