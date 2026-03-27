trigger AccountTriggerOne on Account (before insert,after Insert, before update,after Update) {

    if(Trigger.isInsert){
        if(Trigger.isBefore){
        AccountTriggerHandlerOne.copyBillingToShipping(Trigger.New);
    }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
        AccountTriggerHandlerOne.copyBillingToShipping(Trigger.New);
    }
    }
}