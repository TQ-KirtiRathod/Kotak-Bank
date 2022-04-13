({
   init: function (cmp, event, helper) {
        cmp.set('v.mycolumns', [
            { label: 'TCO Name', fieldName: 'Name', type: 'text'},
            { label: 'FY1 Cost (Rs. Lacs)', fieldName: 'FY__c', type: 'number'},
            { label: 'FY2 Cost (Rs. Lacs)', fieldName: 'FY2__c', type: 'number'},
            { label: 'FY3 Cost (Rs. Lacs)', fieldName: 'FY3__c', type: 'number'},
            { label: 'Total Cost (Rs. Lacs)', fieldName: 'Total__c', type: 'number'},
           
        ]);
        helper.getData(cmp);
    },
    handleClick : function(cmp, event, helper){
        var recordId = executionComponent.attributes.recordId;
       var createRecordEvent = $A.get("e.force:navigateToSObject");
        createRecordEvent.setParams({
            "entityApiName": "TCO__c"
        });
        createRecordEvent.fire();
    },
            
})