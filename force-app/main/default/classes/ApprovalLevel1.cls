public class ApprovalLevel1 {
@future(callout = true)
    public Static void LevelOneMethod( Set <Id> caseList ){
  
        List<Case> caseRecords = [SELECT id,Status__c,RecordTypeId,OwnerId,New_Case_Number__c,CreatedDate 
                                    FROM case 
                                   WHERE RecordTypeId='01272000000AaobAAC' 
                                     AND Status__c='Under Approver' 
                                     AND  id IN :caseList];
        System.debug('caseRecords'+caseRecords.size());
        System.debug('caseRecords'+caseRecords.size());
        Approval.ProcessSubmitRequest req1 =  new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.');
        req1.setObjectId(caseRecords[0].id);
        
        // Submit on behalf of a specific submitter
        req1.setSubmitterId(UserInfo.getUserId() ); 
        
        // Submit the record to specific process and skip the criteria evaluation
        req1.setProcessDefinitionNameOrId('Level_1Approval');
        req1.setSkipEntryCriteria(true);
    
    }
}