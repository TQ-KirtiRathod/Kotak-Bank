public with sharing class getTCOData {
	@AuraEnabled
    public static List<TCO__c> getContacts() {
        List<TCO__c> Tcodata = [SELECT Id, Name, FY__c, FY2__c, FY3__c, Total__c 
                                FROM TCO__c 
                                LIMIT 10];
        //Add isAccessible() check
        return Tcodata;
    }
}