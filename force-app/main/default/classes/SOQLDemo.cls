public class SOQLDemo {
    
    Public static void queryDemo1(){  // Simple Query with LIMIT
        List<Account> accList = [SELECT Id,Name, Industry from Account LIMIT 10];        
        for(Account acc:accList){
            System.debug(acc);
        }    
    }
    
    
    Public static void queryDemo2(){ // Query with WHERE, AND,OR,IN,ORDER BY,NULLS First/Last
     // List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry ='Media' AND Rating ='Hot'];
     // List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry ='Media' OR Rating ='Hot'];
     // List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry IN ('Media','Energy')];
     // List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry ='Media' ORDER By Name ASC];
     // List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry ='Media' ORDER By Name DESC];
        List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry ='Media' ORDER By Rating NULLS Last];
        
        for(Account acc:accList){
            System.debug(acc);
        }
    }
    
    
    Public static void queryDemo3(){ // query to use a variable in a SOQL query
      //String indus= 'Media';
        Integer AR = 10000;
      //List<Account> accList = [SELECT Id,Name, Industry,Rating FROM Account WHERE Industry =:indus];      // =: -- is when you use a variable in place of direct value  
        List<Account> accList = [SELECT Id,Name, Industry,AnnualRevenue FROM Account WHERE AnnualRevenue >=:AR];
        
        for(Account acc:accList){
            System.debug(acc);
        }    
    }
    
    
    Public static void queryDemo4(){   // Query to use Set/List in a Query
        Set <Id> accIds = new Set<Id>();
        List<Account> accList = [SELECT Id from Account LIMIT 10];
        for(Account acc:accList){
            accIds.add(acc.Id);
        }
        
        List<Account> accList2 = [SELECT Id,Name,Rating,AnnualRevenue FROM Account WHERE Id IN:accIds];
        for(Account acco: accList2){
            System.debug(acco);
        }
    }
    
    
    Public static void queryDemo5(){ // Use of Count,COUNT_DISTINCT, MAX, MIN, SUM, Having
        System.debug([SELECT Count() FROM Account]);
        System.debug([SELECT Count(Name) FROM Account]);
        System.debug([SELECT COUNT_DISTINCT(Industry) FROM Account]);
        System.debug([SELECT MAX(AnnualRevenue) FROM Account]);
        System.debug([SELECT MIN(AnnualRevenue) FROM Account]);
        System.debug([SELECT SUM(AnnualRevenue) FROM Account]);
        System.debug([SELECT SUM(Amount),Account.Name FROM Opportunity Group By Account.Name]);
        System.debug([SELECT SUM(Amount),Account.Name FROM Opportunity Group By Account.Name HAVING SUM(Amount)>50000]);
        
    }
    
    
    Public static void aggDemo(){
        AggregateResult[] groupedResult = [SELECT Account.Name,Sum(Amount) amt FROM Opportunity GROUP BY Account.Name];
        System.debug(groupedResult);
        for (AggregateResult ar :groupedResult ){
            System.debug('Account Id = '+ ar.get('Name'));
            System.debug('Sum of Amount = '+ ar.get('amt'));
        }        
    }
    
    Public static void queryDemo6(){  // Simple Query with LIMIT
        //SELECT COUNT() FROM Account WHERE Name LIKE 's%';
        String s = 'test';
        s='%'+s+'%';
        List<Account> accList = [SELECT Id,Name from Account WHERE Name like:s];        
        for(Account acc:accList){
            System.debug(acc);
        }    
    }
    
    Public static void parentToChildDemo(){
        List<Account> accList = new List<Account>();
        accList = [Select Id,Name,(SELECT Id,FirstName,LastName FROM Contacts) FROM Account WHERE Rating ='Hot'];
        
        for(Account acc : accList){
            System.debug('Account Name = '+ acc.Name);
            for (Contact con: acc.Contacts){
                System.debug(con.FirstName+' '+con.LastName);
            }
        }
    }
    
    Public static void parentToChildDemo2(){
        List<Position__c> posList = new List<Position__c>();
        posList = [Select Id,Name,(SELECT Id,Name FROM Job_Applications__r) FROM Position__c ];
        
        for(Position__c pos : posList){
            System.debug('Position Name = '+ pos.Name);
            for (Job_Application__c ja: pos.Job_Applications__r){
                System.debug(ja.Name);
            }
        }
    }
    
}