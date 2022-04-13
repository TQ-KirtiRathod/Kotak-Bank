trigger CasePdfTrigger on Case (After Update) {
  Set <String> setOfCaseIds = new Set <String>(); 
    if(trigger.isAfter && trigger.isUpdate){
    for (Case objCase: trigger.new) {
        if(objCase.Status__c == 'Approved' && objCase.RecordTypeId=='01272000000AaobAAC'){
            setOfCaseIds.add(objCase.id); 
        }

    }
    }
    if (setOfCaseIds.size() > 0) {
        AttachmentPdf.generatePdf(setOfCaseIds); 
    }
}