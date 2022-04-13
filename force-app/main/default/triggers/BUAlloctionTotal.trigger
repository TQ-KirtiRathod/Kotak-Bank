trigger BUAlloctionTotal on Bussiness_Unit__c ( before insert, after insert, after update) {

    List<Case> caList= new List<Case>();
    Set<ID> caIds= new Set<ID>();
    for(Bussiness_Unit__c bu: Trigger.new){
        caIds.add(bu.Case__c);
    }
	map<ID,Case> buMap = new map<Id,Case>([select Id, Allocation_Total__c, 
                                                  (select Id, Allocation__c, Case__c from Bussiness_Unit__r) from Case where Id IN: caIds]);
  // List<>select id,Allocation__c,Bussiness_unit__c,Case__c,CC__c,LOC__c from Bussiness_Unit__c where Case__c =:caseRecord 
    for(Case c: buMap.values()){//Trigger.new
        Decimal sum1=0;
        Case cas=  buMap.get(c.id);
        for(Bussiness_Unit__c bu: cas.Bussiness_Unit__r){
            sum1= sum1+(bu.Allocation__c!=null?bu.Allocation__c:0);
            
        }
        cas.Allocation_Total__c=sum1;
        caList.add(cas);
        
    }
    update caList;
    
}