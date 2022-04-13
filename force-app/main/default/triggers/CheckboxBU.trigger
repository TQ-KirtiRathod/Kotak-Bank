trigger CheckboxBU on Bussiness_Unit__c (after insert, after update) {
List<Case> cList= new List<Case>();
    set<ID> BUId= new set<ID>();
    for(Bussiness_Unit__c bu: Trigger.new){
        BUId.add(bu.Case__c);
    }
    List<Case> caseList= [select id, Business_Unit__c from Case where id IN :BUId];
    for(Case c: caseList){
        c.Business_Unit__c=true;
        cList.add(c);
    }
    update cList;
}