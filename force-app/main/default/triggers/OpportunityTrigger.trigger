trigger OpportunityTrigger on Opportunity (Before Insert,After update) {

    if(Trigger.isUpdate){
        if(Trigger.isAfter){
            if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall = TRUE;
           		OpportunityTriggerHandler.updateDesc(Trigger.New,Trigger.oldMap);
            }
        }
    }
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            OpportunityTriggerHandler.validateAmount(Trigger.New);
        }
    }
    
}