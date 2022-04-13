trigger CaseTrigger on Case (After insert,before update,after update) {
    List<Case> caseApproval= new List<Case>(); 
    Set <String> setOfCaseIds = new Set <String>(); 
    
    if (trigger.isAfter && trigger.isInsert){
       CaseTriggerHandler.UpdateCase(Trigger.new);
    }
    if(trigger.isBefore && trigger.isUpdate){
        
        CaseTriggerHandler.BeforeCaseUpdate(Trigger.oldmap,Trigger.new);
    }
    

}