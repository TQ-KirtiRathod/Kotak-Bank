@Istest
public class AttachmentPdfTestClass {
    
      @Istest
   public static void CreateCaserecord(){
User ObjUser = [SELECT ID,Name FROM USER Where Name = 'Rohit Khayde'];
       User ObjUserJindal = [SELECT ID,Name FROM USER Where Id = '00572000002YZtVAAW'];


Id stExam = Schema.SObjectType.case.getRecordTypeInfosByName().get('Board_Note').getRecordTypeId();
 
       List<Case> lstcase = new List<Case>();
       integer i ;
       For(i = 1; i <= 10 ; i++){
           
           Case obj = New Case();
            obj.RecordTypeId = stExam ;
           obj.Title__c = 'Testcase' + i;
           obj.project_Type__c = 'Hardware';
          obj.Background_Existing_Process__c = 'Createst for testing';
        obj.Name_of_System__c = ' Kotak ' ;
  obj.Proposed_Solution__c = ' Create cases for testing';
   obj.Recommendations__c = ' XYZ';
  obj.Reviewer__c = ObjUserJindal.id;
obj.Approval_Level__c = '1';
      
	obj.Level_1__c = TRUE ;
obj.Approval_Level_1__c = ObjUser.Id;
lstcase.add(obj);}
if(!lstcase.isempty()){
insert lstcase;
}  
      
           System.debug('Case ::' + lstcase.size() );
       System.assert(!lstcase.isempty());
      List<Case> CaseList = New List<Case>();
     For(Case ObjCase : lstcase ){
         ObjCase.Status__c = 'Approved';
         CaseList.add(ObjCase );
         
     }  
       Update CaseList;
    }
    

    }