public class branchDataController {
@AuraEnabled
    public static List<Branch__c> fetchData() {
        //Query and return list of Contacts
        List<Branch__c> branchRecords = [SELECT Name, Branch_Code__c, Branch_Category__c, City__c, District__c, IS_ACTIVE__c,  Region__c, Sub_Class_Desc__c, Zone__c
                                           FROM Branch__c 
                                           LIMIT 50000];
        return branchRecords;
    }
    @AuraEnabled
    public static String updateRecord(String branchId, String recordId) {
        system.debug('recordId'+recordId);
        system.debug('branchId'+branchId);
        String message = '';
        if(branchId <> null && recordId <> null){
        Case c = new Case();
        c.Id = recordId;
        c.Branch__c = branchId;
        update c;
            system.debug('c'+c);
        return 'success';
        }
        return null;
    }
}