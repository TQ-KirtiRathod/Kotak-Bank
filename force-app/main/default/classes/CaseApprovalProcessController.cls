public class CaseApprovalProcessController {
   /* @auraEnabled
    public static string submitAndProcessApprovalRequest(String recordId, String comment,Id UserChkId) {
        string response;
        Id Userid=UserInfo.getUserId();
        //list<User> SecondApproval= [select id from User];
        try
        {
            recordId = String.escapeSingleQuotes(recordId);
            comment = String.escapeSingleQuotes(comment);
            UserChkId = String.escapeSingleQuotes(UserChkId);
            Id idToProccess = recordId;
            Schema.sObjectType entityType = idToProccess.getSObjectType();
            system.debug('entityType:::'+entityType);
            String entity = String.valueOf(entityType);
            system.debug('entity:::'+entity);
            
            ApprovalInstance__c Ap = new ApprovalInstance__c();
            Ap.Approval_Status__c='Pending';
            Ap.Object_Name__c =entity;
            Ap.Submitter_U__c=Userid;
            //Ap.Approver__c=UserChkId;
            Ap.Submitter_Comment__c=comment;
            //Ap.Submitter__c=Userid;  
            Ap.Approver_U__c=UserChkId;
            Ap.TargetObjectId__c=recordId;
          //  Ap.Quote_Relation__c=recordId;
            insert Ap;
            response = 'success';
        }
        catch(System.DmlException ex)
        {
            system.debug('Error Message ::: ' + Ex.getMessage() + ' Due to this issues ::: ' + Ex.getLineNumber());   
            response = Ex.getMessage(); 
        }
        return response;
    }
    
    @auraEnabled
    public static string ApprovedOrReject(String recordId, String comment,String State) {
        string response;
        Id Userid=UserInfo.getUserId();
        //list<User> SecondApproval= [select id from User];
        try
        {
            recordId = String.escapeSingleQuotes(recordId);
            comment = String.escapeSingleQuotes(comment);
            Id idToProccess = recordId;
            Schema.sObjectType entityType = idToProccess.getSObjectType();
            system.debug('entityType:::'+entityType);
            String entity = String.valueOf(entityType);
            system.debug('entity:::'+entity);
            List<ApprovalInstance__c> appProcessList = [Select Id,Submitter_Comment__c,Approver_Comment__c, Approval_Status__c,TargetObjectId__c From ApprovalInstance__c WHERE TargetObjectId__c =: recordId AND Approval_Status__c ='Pending' LIMIT 1];
            
            for(Integer i=0;i<appProcessList.size();i++)
            {
                if(State=='Approved')
                {
                	appProcessList[i].Approval_Status__c='Approved';
                }
                else if(State =='Rejected')
                {
                    appProcessList[i].Approval_Status__c='Rejected';
                }
                appProcessList[i].Approver_Comment__c=comment;
             }
            update appProcessList;
            response = 'success';
        }
        catch(System.DmlException ex)
        {
            system.debug('Error Message ::: ' + Ex.getMessage() + ' Due to this issues ::: ' + Ex.getLineNumber());   
            response = Ex.getMessage(); 
        }
        return response;
    }
    
    @auraEnabled
    public static string approvalProcessStatus(String recordId) 
    {
        string response;
        recordId = String.escapeSingleQuotes(recordId);
        //Taking out already running Approval Process.
        List<ApprovalInstance__c> appProcessList = [Select Id, Approval_Status__c From ApprovalInstance__c WHERE TargetObjectId__c =: recordId AND (Approval_Status__c ='Pending' OR Approval_Status__c ='Approved') LIMIT 1];
        if(appProcessList.size()==0)
        {
            response = 'success';
        }
        else
        {
            response = 'failure';
        }
        system.debug('response::'+response);
        return response;
    }
    
    @auraEnabled
    public static string CheckDocumentAttatched(String recordId)
    {
        String responce;
        list<Attachment> CheckAttachment = [SELECT Id, ParentId, Name, IsPrivate, BodyLength, Body, OwnerId, Description FROM Attachment Where ParentId =:recordId limit 100];
        if(CheckAttachment.size() > 0 )
        {
            responce='Success';
        }
        else
        {
            responce='failure';
        }
        
        return responce;
    }
    
    @AuraEnabled
    public static Id SaveFile(Id parentId, String fileName, String base64Data, String contentType) 
    {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Attachment attach = new Attachment();
        attach.parentId = parentId;
        attach.Body = EncodingUtil.base64Decode(base64Data);
        attach.Name = fileName;
        attach.ContentType = contentType;
        Insert attach;
        return attach.Id;
    }
    
    @auraEnabled
    public static string ApprovalRequestCheck(String recordId)
    {
        string response;
        //Id Userid=UserInfo.getUserId();
        recordId = String.escapeSingleQuotes(recordId);
        //Taking out already running Approval Process.
        List<ApprovalInstance__c> appProcessList = [Select Id,Name, TargetObjectId__c, Approval_Status__c, Object_Name__c, Submitter_Comment__c, Approver_Comment__c, Approver__c, Submitter__c From ApprovalInstance__c WHERE TargetObjectId__c =: recordId AND Approval_Status__c ='Pending' LIMIT 1];
        if(appProcessList.size()==0)
        {
            response = 'failure';
        }
        else
        {
            response = 'success';
        }
        system.debug('response::'+response);
        return response;
    }
    @auraEnabled
    public static string UserCheck(String recordId)
    {
        String responseUser;
        Id Userid=UserInfo.getUserId();
   		recordId = String.escapeSingleQuotes(recordId);
        //Taking out already running Approval Process.
        List<ApprovalInstance__c> appProcessList = [Select Id,Name, TargetObjectId__c, Approval_Status__c, Object_Name__c, Submitter_Comment__c, Approver_Comment__c,Approver_U__c, Submitter_U__c From ApprovalInstance__c WHERE TargetObjectId__c =: recordId AND Approval_Status__c ='Pending' LIMIT 1];
		
        if(appProcessList[0].Approver_U__c != Userid)
        {
            responseUser = 'Userfailure';
        }
        else
        {
            responseUser = 'success';
        }    
        system.debug('responseUser::'+responseUser);
        return responseUser;
    }*/

}