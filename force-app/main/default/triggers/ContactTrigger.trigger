trigger ContactTrigger on Contact (After insert, After delete,after undelete) {
   
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.New);
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.Old);
        }
    }
    
        if(Trigger.isUndelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.New);
        }
    }
}