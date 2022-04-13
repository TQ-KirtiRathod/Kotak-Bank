trigger CaseApprovalTrigger on Case (after update) {
/*    List<GroupMember> DeleteGroupMemberRecord =new List<GroupMember>();
    if (trigger.isAfter && trigger.isUpdate){
        List<Case> caseList = new List<Case>();
        for(Case c : Trigger.new){
            caseList.add(c);
            
            
        } 
        for(Case co: caseList){
            Id userId = '00572000002YYZDAA4';
            Group g = [select Id from Group where Name='Level 1Q' AND Type = 'Queue'];
            list<GroupMember> listGroupMember =[Select id,UserOrGroupId,GroupId from GroupMember where UserOrGroupId  =:g.Id];
            for(GroupMember gm:listGroupMember){
                if(gm.UserOrGroupId != null){
                    DeleteGroupMemberRecord.add(gm);
                    delete DeleteGroupMemberRecord;
                }else{
                    GroupMember member = new GroupMember();
                    member.UserOrGroupId = userId;
                    member.GroupId = g.Id;
                    insert member;
                }
                
            }
            if(co.Status__c == 'Under Approver'){
                
               approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
                req1.setComments('Submitting request for approval.');
                req1.setObjectId(co.id);
                
                // Submit on behalf of a specific submitter
                req1.setSubmitterId(UserInfo.getUserId() ); 
                
                // Submit the record to specific process and skip the criteria evaluation
                req1.setProcessDefinitionNameOrId('Level_1Approval');
                req1.setSkipEntryCriteria(true);
                
                // Submit the approval request for the account
                 approval.ProcessResult result = Approval.process(req1);
            }
        }
        
        
    }*/
}