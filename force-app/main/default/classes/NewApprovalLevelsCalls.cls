public class NewApprovalLevelsCalls {
    public static void approvalCallsMethod(){
        List<Case> caseRecords = [Select id,Status__c,RecordTypeId,OwnerId,New_Case_Number__c,CreatedDate From case where RecordTypeId='01272000000AaobAAC' And Status__c='Under Approver' ];
        Set<ID> setCaseId = new Set<Id>();
        for(case cc:caseRecords){
            setCaseId.add(cc.id);
        }
        Set<ID> setGroupId = new Set<Id>();
        List<GroupMember> DeleteGroupMemberRecord =new List<GroupMember>();
        Group q =[Select id,DeveloperName,Name from Group where DeveloperName ='Level_1Q' AND Type = 'Queue'  ];
        setGroupId.add(q.id);
        
        list<GroupMember> listGroupMember =[Select id,UserOrGroupId,GroupId from GroupMember where UserOrGroupId IN :setGroupId];
        
        for(GroupMember gm:listGroupMember){
            GroupMember gm1 = new GroupMember();
            gm1.GroupId =q.id;
            DeleteGroupMemberRecord.add(gm1);
        }
        if(DeleteGroupMemberRecord!=NULL && DeleteGroupMemberRecord.Size()>0) {
                delete DeleteGroupMemberRecord;
            }
        System.debug('DeleteGroupMemberRecord'+DeleteGroupMemberRecord);
        id uId='00572000002YYZDAA4';
        GroupMember member = new GroupMember();
        member.UserOrGroupId = uId;
        member.GroupId = q.Id;
        insert member;
        System.debug('Inserted Member::'+member);
        
        ApprovalLevel1.LevelOneMethod(setCaseId); 
        
    }
}