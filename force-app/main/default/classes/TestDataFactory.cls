@Istest
public class TestDataFactory {

   
        @Istest
        Public Static  void Createcase (){
            User ObjUser = [SELECT ID,Name FROM USER Where Name = 'Rohit Khayde'];
            User ObjUserJindal = [SELECT ID,Name FROM USER Where Id = '00572000002YZtVAAW'];
            
            
            Id stExam = Schema.SObjectType.case.getRecordTypeInfosByName().get('Board_Note').getRecordTypeId();
            
            Case obj = New Case();
           // obj.RecordTypeId.developername = 'Board_Note' ;
            obj.RecordTypeId = stExam ;
            obj.Title__c = 'Testcase' ;
            obj.project_Type__c = 'Hardware';
            obj.Background_Existing_Process__c = 'Createst for testing';
            obj.Name_of_System__c = ' Kotak ' ;
            obj.Proposed_Solution__c = ' Create cases for testing';
            obj.Recommendations__c = ' XYZ';
            obj.Reviewer__c = ObjUserJindal.id;
            obj.Approval_Level__c = '1';
            obj.Level_1__c = TRUE ;
            obj.Approval_Level_1__c = ObjUser.Id;
            insert obj;
            
            LOB__c ObjLob = new LOB__c();
            ObjLob.Name = Obj.Title__c;
            ObjLob.Case__c = Obj.id;
            insert ObjLob;
            
            
            LOC__c objloc = new LOC__c();
            objloc.Name = 'Test Loc';
            Insert objloc;
            
            CC__c objCC = new CC__c();
            objCC.Name  = 'TestCC';
            insert obj;
            
            Bussiness_Unit__c objBu = new Bussiness_Unit__c();
            objbu.Case__c  = obj.Id;
            objBu.Allocation__c = 45;
            objBu.LOC_New__c = objloc.id;
            objBu.LOB_New__c = ObjLob.Id; 
                insert objBu;
        }   
    Public static void CreateTCO(){
        User ObjUser = [SELECT ID,Name FROM USER Where Name = 'Shruti Khodabole'];
        Case obj = [SELECT Id FROM Case ];
        TCO__c objTCo = new TCO__c();
        objTCo.Name = 'TestTCo';
        objTCo.FY2__c = 25000;
        objTCo.FY3__c = 3000;
        objTCo.FY__c = 1500;
        objTCo.OwnerId = ObjUser.Id;
            objTCo.Case__c = obj.Id;
        Insert objTCo;
        
    }
        }