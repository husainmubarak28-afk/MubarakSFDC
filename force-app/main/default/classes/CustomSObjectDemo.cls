public class CustomSObjectDemo {
    Public static void createPosition(){
        Position__c pos = new Position__c();
        pos.Name = 'Mulesoft Developer';
        pos.RecordTypeId = '012J20000004JGuIAM';
        insert pos;
    }
	
    public static void createCandidate(){
        Candidate__c can = new Candidate__c();
        can.First_Name__c = 'SABIR';
        can.Last_Name__c = 'Ali';
        can.Country__c = 'India';
        can.Email__c ='sabir211@gmail.com';
        insert can;
    }
    
    public static void createJobApplicationAndReview(){
        Job_Application__c JA = new Job_Application__c();
        
        Position__c pos = new Position__c();
        pos.Name = 'SFDC Developer';
        pos.RecordTypeId = '012J20000004JGuIAM';
        insert pos;
        
        Candidate__c can = new Candidate__c();
        can.First_Name__c = 'SABIR';
        can.Last_Name__c = '301';
        can.Country__c = 'India';
        can.Email__c ='sabir301@gmail.com';
        insert can;
        
        JA.Position__c = pos.Id;
        JA.Candidate__c = can.Id;
        JA.Status__c = 'New';
        insert JA;
        
        Review__c rv = new Review__c();
        rv.Job_Application__c = JA.Id;
        rv.Rating__c = 4;
        insert rv;
    }
}