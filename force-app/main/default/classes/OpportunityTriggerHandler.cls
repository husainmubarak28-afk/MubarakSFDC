public class OpportunityTriggerHandler {

    Public Static void updateDesc(List<Opportunity> oppList, Map<Id,Opportunity> OldMap){
        List<Opportunity> oppListToBeUpdate = new List<Opportunity>();
        
        for(Opportunity opp:oppList){
            if(opp.stageName != OldMap.get(opp.Id).StageName ){
                Opportunity o = new Opportunity();
                o.Id = opp.Id;
                if(opp.StageName == 'Closed Won'){
                    o.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName == 'Closed Lost'){  
                    o.Description = 'Opportunity is Closed Lost';
                }
                oppListToBeUpdate.add(o);
            }
        }
        if(!oppListToBeUpdate.isEmpty()){
            update oppListToBeUpdate;
        }
    }
    
    Public Static void validateAmount(List<Opportunity> oppList){
        For(Opportunity opp:oppList){
            if(opp.Amount == null){
             //   opp.addError('Please populate Amount on Opportunity');
            }
        }
    }
}