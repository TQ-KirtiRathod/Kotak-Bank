public with sharing class RelatedObjects {
public List<Bussiness_Unit__c> caseBUList{get;set;}
public List<TCO__c> caseTCO{get;set;}
public id caseRecord {get;set;}
public string renderingService{get;set;}
public String dtIst1{get;set;}
public String dtIst2{get;set;}
public String dtIst3{get;set;}
public String dtIst4{get;set;}
public String dtIst5{get;set;}
public string reviewedDate{get;set;}
//public id caseRecord2 {get;set;}
public RelatedObjects(ApexPages.StandardController controller) {

     //caseRecord  = (Case)controller.getRecord();
      renderingService = 'PDF';
      caseRecord  =    ApexPages.currentPage().getParameters().get('id');
      caseBUList =[select id,Allocation__c,Case__c,CC_New__r.name,LOC_New__r.name,LOB_New__r.name from Bussiness_Unit__c where Case__c =:caseRecord  ];
      Case record = [SELECT Id,Date_Time_Level_1__c, Date_Time_Level_2__c, Date_Time_Level_3__c,Date_Time_Level_4__c, Date_Time_Level_5__c, Approved_Date_Time__c
                FROM Case 
                WHERE id =:caseRecord];
      Datetime dat = DateTime.ValueOf(record.get('Approved_Date_Time__c')); 
    if(dat != null) {
        reviewedDate = dat.format('yyyy-MM-dd HH:mm:ss', 'IST'); 
    }
    
      
    for(integer i = 1 ; i<=5;i++) {
        Datetime dt = DateTime.ValueOf(record.get('Date_Time_Level_'+i+'__c'));
        if(i==1 && dt != null) {
          dtIst1 = dt.format('yyyy-MM-dd HH:mm:ss', 'IST');  
        } else if(i==2 && dt != null) {
            dtIst2 = dt.format('yyyy-MM-dd HH:mm:ss', 'IST');  
        }else if(i==3 && dt != null) {
             dtIst3 = dt.format('yyyy-MM-dd HH:mm:ss', 'IST'); 
        }else if(i==4 && dt != null) {
             dtIst4 = dt.format('yyyy-MM-dd HH:mm:ss', 'IST'); 
        }else {
            if(dt != null){
                dtIst5 = dt.format('yyyy-MM-dd HH:mm:ss', 'IST'); 
            }
            
        }
        
    }  
          
      // caseRecord2  =    ApexPages.currentPage().getParameters().get('id');
         caseTCO = [select id,Name,FY__c,FY2__c,FY3__c,Total__c,Case__c from TCO__c where Case__c =:caseRecord  ];
}

}