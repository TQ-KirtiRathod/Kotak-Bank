public with sharing class tcocontroller {
    @AuraEnabled
    public static List<TCO__C> getContacts( ID recordIds) {
        List<TCO__C> tcoList = [SELECT Id, FY__c, FY2__c, FY3__c, Total__c 
                                  FROM TCO__C 
                                 where id =: recordIds];
        //Add isAccessible() check
       
        //Integer fy1Total, fy2Total, fy3Total, grandTotal;
         return tcoList;
    }
     
}