public class cls_createApprovalURL {
    public static String generateApprovalURL(String recordID){
         String url='';
         List <ProcessInstanceWorkitem > workItemList = [SELECT id FROM ProcessInstanceWorkitem WHERE processInstance.TargetObjectId=:recordID];
            if(workItemList.size() > 0){
               url='https://'+ System.URL.getSalesforceBaseUrl().getHost() + '/p/process/ProcessInstanceWorkitemWizardStageManager?id=' + workItemList[0].id;
            }
        return url;
      }

}