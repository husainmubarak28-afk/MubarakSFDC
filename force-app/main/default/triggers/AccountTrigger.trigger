trigger AccountTrigger on Account (before insert,after insert,before update,after update,before delete) {
    

        if(Trigger.isBefore){
            AccountTriggerHandler.updateDesc(Trigger.New); //Trigger.New is a sObject List
            AccountTriggerHandler.populateRating(Trigger.New,null);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.createOpp(Trigger.New);
           Boolean b= AccountTriggerHandler.handleAccount(Trigger.New);
        }   
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerHandler.updatePhone(Trigger.new,Trigger.oldMap);
            AccountTriggerHandler.populateRating(Trigger.New,Trigger.oldMap);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.updateRelatedContact(Trigger.New,Trigger.oldMap);
            AccountTriggerHandler.updateRelatedContactWithSOQL(Trigger.New,Trigger.oldMap);
            
            if(!PreventRecursion.firstCall){
                PreventRecursion.firstCall = TRUE;
                AccountTriggerHandler.updateAccount(Trigger.New,Trigger.oldMap);
            }
            
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountTriggerHandler.preventDeletion(Trigger.old);
        }
    }
}