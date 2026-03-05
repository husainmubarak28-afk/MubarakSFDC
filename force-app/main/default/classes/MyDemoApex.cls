public class MyDemoApex {
    
    
    // Scenario 1 : Query Account records created this year.Now Insert one opportunity record for each account.
    // Code 1 Start
    public static void createOppOnAccount(){
        List<Account> accList = [SELECT Id, Name FROM Account WHERE CreatedDate= THIS_YEAR];
        List<Opportunity> newOppList = new List<Opportunity>();
        
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Opportunity opp = new Opportunity();
                opp.Name= acc.Name;
                opp.StageName ='Prospecting';
                opp.AccountId = acc.Id;
                opp.CloseDate =System.Today();
            }
        }
        
        if(!newOppList.isEmpty()){
            insert newOppList;
        }
    }
    // Code 1 END
    
    
    //Scenario 2 : Query Account records created this week.Now update phone number of all accounts with '1234567890' value.
    //Code 2 Start
    public static void UpdateAccountPhone(){
        List<Account> accList = new List<Account>();
            for(Account acc: [SELECT Id, Name FROM Account WHERE CreatedDate= THIS_WEEK]){
                acc.Phone ='1234567890';
                accList.add(acc);
            }
        if(!accList.isEmpty()){
              update accList;
        }
    }
    //Code 2 END
    
    
    /*Scenario 3 : Query Opportunitiew created in this week. If Opportunity Stage is closed won then update description
	as 'Opportunity is Cosed Won', in case of Closed lost update as 'Opportunity is Closed Lost'.
	*/
    //Code 3 Start
    Public static void updateOppDescription(){
    
    List <Opportunity> newOppList = new List<Opportunity>();
     for (Opportunity opp: [SELECT Id, Name, StageName,CloseDate FROM Opportunity WHERE CreatedDate = THIS_WEEK]){
         if(opp.StageName =='Closed Won'){
             opp.Description ='Opportunity is Cosed Won';    
         }else if(opp.StageName =='Closed Lost'){
             opp.Description ='Opportunity is Cosed Lost';
         }
             newOppList.add(opp);
         if(!newOppList.isEmpty()){
             update newOppList;
         }
      }        
    }
    //Code 3 END
    
    
    /* Scenario 4: Query Accounts Created last Week. Populate 'Total Contacts' Find on Account by counting number of contacts 
      associated with Account. If no contact then populate 0. */
    //Code 4 Start
    
    Public Static void totalContactsOnAccount(){
        //Parent to Child SOQL
        List<Account> accList = [SELECT Id, Name, (SELECT Id,FirstName,LastName FROM Contacts) FROM Account WHERE CreatedDate = THIS_WEEK];
		
        if(!accList.isEmpty()){
            For(Account acc: accList){
                acc.Total_Contact_Count__c =acc.Contacts.size();
            }
        }
             if(!accList.isEmpty()){
            update accList;
        }
    }
    //Code 4 END
	
    
    // Scenarion 5:Query Contacts Craeted This Week and if phone is not populated on contact then copy Phone on Related Account.
    // Code 5 Start
    Public Static void populatePhoneOnContact(){
        List<Contact> conList = [SELECT Id,FirstName,LastName,Phone, Account.Phone 
                                 FROM Contact WHERE AccountId != null];
                               //  WHERE CreatedDate = THIS_WEEK && AccountId != null];
        if(!conList.isEmpty()){
            for (Contact con:conList){
                if(con.Phone==null){
                   con.Phone = con.Account.Phone; 
                }
            }
            if(!conList.isEmpty()){
                update conList;
            }
        }
    }
    //Code 5 END
    
    /* Scenario 6: Craete a custom Object named "Employee". Craete Salary, Lookup (Account) fields on Employee Object. Create a 
       Total Salary field on Account. Now Query Accounts created this Year along with related Employees. Populate total salary of
	   all related employees on account. */

	//Code 6 Start 
    Public static void populateTotalSalary(){
        List<Account> accList= [SELECT Id, Name, Total_Salary__c, (Select Id,Name, Salary__c FROM Employees__r ) FROM Account WHERE CreatedDate= THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                Decimal TotalSal= 0;
                for(Employee__c emp: acc.Employees__r){
                    TotalSal = TotalSal + emp.Salary__c;
                }
                acc.Total_Contact_Count__c = TotalSal;
            }
        }
        
        if(!accList.isEmpty()){
            update accList;
        }
    }
	// Code 6 END
    
    // Scenario 7 : Query Employees created this week and if Phone is not populated on Employee record then copy Phone of Related Account.
    // Code 7 Start
    
    Public Static void addPhoneOnEmployee(){
        List<Employee__c> empList = [Select Id,Name, Salary__c, Phone__c, Account__r.Phone FROM Employee__c];
        if(!empList.isEmpty()){
            for (Employee__C emp: empList){
                if (emp.Phone__c == null){
                    emp.Phone__c = emp.Account__r.Phone;
                }
            }
            }
            if(!empList.isEmpty()){
                   update empList;
        }
    }
    //Code 7 END
 	
    
    /* Scenario 8: Query Accounts created This Week and populate Account Phone on related contacts
	-Implimentation using parent to child soql.
	-Implimentation using Map. */
	
    //Code 8.1 - Implimentation using parent to child soql. Start
    Public static Void updatePhoneOnContact(){
        List<Account> accList = [SELECT Id,Name,Phone, 
                                 (SELECT Id,Name, Phone FROM Contacts) 
                                 FROM Account 
                                 WHERE CreatedDate = THIS_WEEK];
        List<Contact> conList= new List<Contact>();
        if(!accList.isEmpty()){
            for(Account acc:accList){
                if(acc.Phone != null){
                    for(Contact con: acc.Contacts){
                        Contact conRec = new Contact();
                        ConRec.id = con.id;
                        conRec.Phone =acc.Phone;
                        conList.add(conRec);
                    }  
                 }
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    //Code 8.1 END
    
    
    //Code 8.2- Implimentation using Map. Start
    Public static Void updatePhoneOnContactWithMap(){
        List<Account> accList = [SELECT Id,Name,Phone
                                 FROM Account 
                                 WHERE CreatedDate = THIS_WEEK AND Phone != null];
        Map<Id,Account> accIdToAccountMap = new Map<Id,Account>();
        
        //for(Account acc: accList){
        //	accIdToAccountMap.put(acc.Id);
        //	}
        
        List<Contact> conList= [Select Id,AccountId,Phone FROM Contact
                               WHERE AccountId IN:accIdToAccountMap.keySet()];
        List<Contact> newContacts = new List<Contact>();
        if(!accList.isEmpty()){
            for(Contact con: conList){
                if (accIdToAccountMap.containsKey(con.AccountId)){
                    Contact conRec = new Contact();
                    conRec.Id =con.Id;
                    conRec.Phone = accIdToAccountMap.get(con.AccountId).Phone;
                    newContacts.add(conRec);
                }
            }
        }
        if(!newContacts.isEmpty()){
            update newContacts;
        }
    }    
    
    //Code 8.2 END
}