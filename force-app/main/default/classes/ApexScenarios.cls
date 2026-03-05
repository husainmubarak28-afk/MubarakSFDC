public class ApexScenarios {
    
    Public static void apexScenario1(){
	List<Account> accList = new List<Account>();
        accList = [Select Id, Name, (Select Id, Name from Contacts) From Account WHERE Phone!= null];
        if(!accList.isEmpty()){
            for (Account acc : accList){
            System.debug(acc.Name + ' has ' + acc.Contacts.size() + ' Contacts related');
            }
        }  
    }
    
    Public static void apexScenario2(){
        List<Account> accList = new List<Account>();
        accList = [Select Id, Name, (Select Id,Amount from Opportunities ) From Account WHERE Phone!= null];
        if(!accList.isEmpty()){
            for (Account acc : accList){
            Decimal total = 0;
                for(Opportunity opp: acc.Opportunities){
                    if(opp.Amount != null ){
                       total = total + opp.amount;
                    }
                }
                System.debug(acc.Name + ' has ' + total + ' worth Opportunities');
            }
        }    
    }
    
    Public static void apexScenario3(){
        
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [SELECT Id,Name, StageName From Opportunity WHERE CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for (Opportunity opp: oppList){
                
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is Closed Lost';
                }else{
                    opp.Description = ' Opportunity is Open';
                }
            }
            update oppList;
        }
    }
    
    Public static void apexScenario4(){
        
        List<Account> accList = new List<Account>();
        accList =[SELECT Id,Total_Contact_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE CreatedDate = THIS_YEAR];
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
               acc.Total_Contact_Count__c = acc.Contacts.size();
            }
            update accList;
        }
    }
    
    Public static void apexScenario5(){
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id,MobilePhone,Account.Phone FROM Contact WHERE CreatedDate =THIS_YEAR];     
        if(!conList.isEmpty()){
            for (Contact con: conList){
                if(con.MobilePhone == null && con.Account.Phone != null){
                    con.MobilePhone = con.Account.Phone;
                }
            }
            update conList;
        }
    }
}