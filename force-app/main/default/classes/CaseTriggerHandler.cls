public class CaseTriggerHandler {

   
    
    Public  static Void UpdateCase(List<Case> LstCase){
     Id CaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Board Note').getRecordTypeId();
         List<Case> caseList = new List<Case>();
        List<Case> caseListupdates = new List<Case>(); 
        
        for(Case c : LstCase){
            caseList.add(c);
            
            
        }
     
        List<String> str = new List<String>();
        List<Case> caseobj = [select id,Level__c,RecordTypeId,Approval_Level__c,Approval_Level_1__r.Name,Approval_Level_2__r.Name,Approval_Level_3__r.Name,Approval_Level_4__r.Name,
                             Level2_Approver1__r.Name,Level2_Approver2__r.Name,Level_2_Approver_3__r.Name,Level2_Approver4__r.Name,
                             Level_3_Approver_1__r.Name,Level_3_Approver_2__r.Name,Level_3_Approver_3__r.Name,Level_3_Approver_4__r.Name,
                             Level_4_Approver_1__r.Name,Level_4_Approver_2__r.Name,Level_4_Approver_3__r.Name,Level_4_Approver_4__r.Name,
                             Level_5_Approver_1__r.Name,Level_5_Approver_2__r.Name,Level_5_Approver_3__r.Name,Level_5_Approver_4__r.Name,
                              Approval_Level_1__c,Approval_Level_2__c,Approval_Level_3__c,Approval_Level_4__c,
                              Level2_Approver1__c,Level2_Approver2__c,Level_2_Approver_3__c,Level2_Approver4__c,
                              Level_3_Approver_1__c,Level_3_Approver_2__c,Level_3_Approver_3__c,Level_3_Approver_4__c,
                              Level_4_Approver_1__c,Level_4_Approver_2__c,Level_4_Approver_3__c,Level_4_Approver_4__c,
                              Level_5_Approver_1__c,Level_5_Approver_2__c,Level_5_Approver_3__c,Level_5_Approver_4__c
                             from Case where id IN :caseList];
        for(Case co : caseobj){
            Case obj = new Case();
            if(co.RecordTypeId == CaseRecordTypeId ){
              
                system.debug('co'+str);
                if(co.Approval_Level__c == '1' || co.Approval_Level__c == '2' || co.Approval_Level__c == '3' || co.Approval_Level__c == '4' || co.Approval_Level__c == '5'){
                   obj.Level_1_Approver_1_New__c = co.Approval_Level_1__r.Name;
                    obj.Level_1_Approver_2_New__c = co.Approval_Level_2__r.Name;
                    obj.Level_1_Approver_3_New__c = co.Approval_Level_3__r.Name;
                    obj.Level_1_Approver_4_New__c = co.Approval_Level_4__r.Name;
                      if(co.Approval_Level_2__c == null){
                    obj.Approval_Level_2__c = co.Approval_Level_1__c;
                      }
                    if(co.Approval_Level_3__c == null){
                    obj.Approval_Level_3__c = co.Approval_Level_1__c;
                    }
                
               if(co.Approval_Level_4__c == null){
                    obj.Approval_Level_4__c = co.Approval_Level_1__c;
               }
                }
                if(co.Approval_Level__c == '1' || co.Approval_Level__c == '2' || co.Approval_Level__c == '3' || co.Approval_Level__c == '4' || co.Approval_Level__c == '5'){
                     obj.Level_2_Approver_1_New__c = co.Level2_Approver1__r.Name;
                    obj.Level_2_Approver_2_New__c = co.Level2_Approver2__r.Name;
                    obj.Level_2_Approver_3_New__c = co.Level_2_Approver_3__r.Name;
                    co.Level_2_Approver_4_New__c = co.Level2_Approver4__r.Name;
                    if(co.Level2_Approver2__c == null){
                    obj.Level2_Approver2__c = co.Level2_Approver1__c;
                }
                if(co.Level_2_Approver_3__c == null){
                    obj.Level_2_Approver_3__c = co.Level2_Approver1__c;
                }
                if(co.Level2_Approver4__c == null){
                    obj.Level2_Approver4__c = co.Level2_Approver1__c;
                }
                     
                    
                
                }
                if(co.Approval_Level__c == '1' || co.Approval_Level__c == '2' || co.Approval_Level__c == '3' || co.Approval_Level__c == '4' || co.Approval_Level__c == '5'){
                   obj.Level_3_Approver_1_New__c = co.Level_3_Approver_1__r.Name;
                    obj.Level_3_Approver_2_New__c = co.Level_3_Approver_2__r.Name;
                    obj.Level_3_Approver_3_New__c = co.Level_3_Approver_3__r.Name;
                    obj.Level_3_Approver_4_New__c = co.Level_3_Approver_4__r.Name;
                    if(co.Level_3_Approver_2__c == null){
                    obj.Level_3_Approver_2__c = co.Level_3_Approver_1__c;
                }
                if(co.Level_3_Approver_3__c == null){
                    obj.Level_3_Approver_3__c = co.Level_3_Approver_1__c;
                }
                if(co.Level_3_Approver_4__c == null){
                    obj.Level_3_Approver_4__c = co.Level_3_Approver_1__c;
                }
                }
                if(co.Approval_Level__c == '1' || co.Approval_Level__c == '2' || co.Approval_Level__c == '3' || co.Approval_Level__c == '4' || co.Approval_Level__c == '5'){
                    obj.Level_4_Approver_1_New__c = co.Level_4_Approver_1__r.Name;
                    obj.Level_4_Approver_2_New__c = co.Level_4_Approver_2__r.Name;
                    obj.Level_4_Approver_3_New__c = co.Level_4_Approver_3__r.Name;
                    co.Level_4_Approver_4_New__c = co.Level_4_Approver_4__r.Name;
                    if(co.Level_4_Approver_2__c == null){
                    obj.Level_4_Approver_2__c = co.Level_4_Approver_1__c;
                }
                if(co.Level_4_Approver_3__c == null){
                    obj.Level_4_Approver_3__c = co.Level_4_Approver_1__c;
                }
                if(co.Level_4_Approver_4__c == null){
                    obj.Level_4_Approver_4__c = co.Level_4_Approver_1__c;
                }
                }
                if(co.Approval_Level__c == '1' || co.Approval_Level__c == '2' || co.Approval_Level__c == '3' || co.Approval_Level__c == '4' || co.Approval_Level__c == '5'){
                    obj.Level_5_Approver_1_New__c = co.Level_5_Approver_1__r.Name;
                    obj.Level_5_Approver_2_New__c = co.Level_5_Approver_2__r.Name;
                    obj.Level_5_Approver_3_New__c = co.Level_5_Approver_3__r.Name;
                    obj.Level_5_Approver_4_New__c = co.Level_5_Approver_4__r.Name;
                    if(co.Level_5_Approver_2__c == null){
                    obj.Level_5_Approver_2__c = co.Level_5_Approver_1__c;
                }
                if(co.Level_5_Approver_3__c == null){
                    obj.Level_5_Approver_3__c = co.Level_5_Approver_1__c;
                }
                if(co.Level_5_Approver_4__c == null){
                    obj.Level_5_Approver_4__c = co.Level_5_Approver_1__c;
                }
                }
                obj.Id = co.Id;
                caseListupdates.add(obj);
                
              
            }
        }
        if(caseListupdates <> null && caseListupdates.size() > 0){
            update caseListupdates;
    }
        
       
        
    
}
    
    Public Static void BeforeCaseUpdate ( Map<Id,Case> oldMap,List<Case> LstCase){
        
        Id CaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Board Note').getRecordTypeId();
          system.debug('ee');
        List<Case> caseList = new List<Case>();
  
        for(Case c : LstCase){
            caseList.add(c);
            
            
        }
       
        List<String> str = new List<String>();
        for(Case co : caseList){
            if(co.RecordTypeId == CaseRecordTypeId){
              
                system.debug('co'+co.Status__c);
                system.debug('level'+co.Approval_Level__c);
                system.debug('co a'+str.contains('1'));
                system.debug('co b'+oldMap.get(co.Id).Status__c);
               
                 if(co.Approval_Level__c == '1' && oldMap.get(co.Id).Status__c == 'Under Level 1 Approval' && co.Status__c <> 'Open'){
                    co.Status__c = 'Approved'; 
                 }
                else if(co.Approval_Level__c == '2' && oldMap.get(co.Id).Status__c == 'Under Level 2 Approval'&& co.Status__c <> 'Open'){
                    co.Status__c = 'Approved';
                }
                else if(co.Approval_Level__c == '3' && oldMap.get(co.Id).Status__c == 'Under Level 3 Approval' && co.Status__c <> 'Open'){
                    co.Status__c = 'Approved'; 
                }else if(co.Approval_Level__c == '4' && oldMap.get(co.Id).Status__c == 'Under Level 4 Approval' && co.Status__c <> 'Open'){
                    co.Status__c = 'Approved'; 
                }
            }
            }
        } 
    
    
     
}