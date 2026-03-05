public class AccountRecord {
    
    // Method1 - For Account Creation
    Public static ID insertAcc(String name,String rating,String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating= rating;
        acc.Active__c = active;
        
        insert acc;	//This statement will insert a record into the Org
        
        return acc.Id;	//After creation of account Record,its ID will be availabe in acc
    }
    
    //Method2 - Contat Craetion with Account
    public static void insertContact(){
        
        Id accId;
        accId = insertAcc('SABIR 2', 'Warm', 'Yes');
        Contact con =new Contact(FirstName = 'SABIR',LastName = 'ALI');
        con.accountId = accId;
        insert con;
    }
    
    //Method3 - Account creation with Contact and Opportunity realated to Account
    Public static void insertAccWithConAndOpp(String name,String rating,String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating= rating;
        acc.Active__c = active;
        
        insert acc;	//This statement will insert a record into the Org
        
       
        Contact con =new Contact();
        con.FirstName ='Shab';
        con.LastName = 'nam';
        con.accountId = acc.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Opp code0';
        opp.CloseDate = System.today();
        opp.StageName ='Prospecting';
        opp.AccountId=acc.Id;
        insert opp;   
    }
}