trigger TcoGrandTotal on TCO__c (before insert, after insert, after update) {
    List<Case> cList= new List<Case>();
    Set<ID> caseIds= new Set<ID>();
    for(TCO__c tc: Trigger.new){
        caseIds.add(tc.Case__c);
    }
	map<ID,Case> tcoMap = new map<Id,Case>([select Id, FY1_Total__c, FY2_Total__c, FY3_Total__c, Grand_Total__c, Business_Unit__c, 
                                                  (select Id, FY__c, FY2__c, FY3__c, Case__c from TCO__r) from Case where Id IN: caseIds]);
    for(Case c: tcoMap.values()){
        Decimal sum1=0, sum2=0, sum3=0, sum4=0;
        Case ca=  tcoMap.get(c.id);
        for(TCO__c tco: ca.TCO__r){
            sum1= sum1+(tco.FY__c!=null?tco.FY__c:0);
            sum2= sum2+(tco.FY2__c!=null?tco.FY2__c:0);
            sum3= sum3+(tco.FY3__c!=null?tco.FY3__c:0);
            sum4= sum1+ sum2 +sum3;
        }
        ca.TCO__c=true;
        ca.FY1_Total__c=sum1;
        ca.FY2_Total__c=sum2;
        ca.FY3_Total__c=sum3;
        ca.Grand_Total__c= sum4;
        cList.add(ca);
        
    }
    update cList;
    
}