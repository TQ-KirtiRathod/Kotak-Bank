({
    init: function (cmp, event, helper) {
     
        var action = cmp.get("c.fetchData");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.data", response.getReturnValue());
                cmp.set("v.filteredData", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    searchTable : function(cmp,event,helper) {
        var allRecords = cmp.get("v.data");
        var searchFilter = event.getSource().get("v.value").toUpperCase();
        
        var tempArray = [];
        var i;
        if(searchFilter != ''){
        for(i=0; i < allRecords.length; i++){
            if((allRecords[i].Branch_Code__c && allRecords[i].Branch_Code__c.toUpperCase().indexOf(searchFilter) != -1))
            {
                tempArray.push(allRecords[i]);
            }
            
        }
            cmp.set('v.columns', [
            { label: 'Branch Code', fieldName: 'Branch_Code__c', type: 'text' },
            { label: 'Branch Name', fieldName: 'Name', type: 'text' },
            { label: 'Branch Category', fieldName: 'Branch_Category__c', type: 'text' },
            { label: 'Region', fieldName: 'Region__c', type: 'text' },
            { label: 'City', fieldName: 'City__c', type: 'text' },
            { label: 'Zone', fieldName: 'Zone__c', type: 'text' },
            { label: 'District', fieldName: 'District__c', type: 'text' },
            { label: 'IS ACTIVE', fieldName: 'IS_ACTIVE__c', type: 'text' },
            { label: 'SUB CLASS DESC', fieldName: 'Sub_Class_Desc__c', type: 'text' }
                
                
        ]);
        }
        cmp.set("v.filteredData",tempArray);
         
        //Checking the data
            if(tempArray.length === 0 && searchFilter.length != 0){
                var toastEvent= $A.get("e.force:showToast");
                toastEvent.setParams({
            "title": "Error",
            "message": "No Data Found",
        });
                toastEvent.fire();
            }
  
     },
    handleSelect: function(component, event, helper){
            var selectedRows = event.getParam('selectedRows'); 
        var setRows = [];
        
        for ( var i = 0; i < selectedRows.length; i++ ) {
               setRows.push(selectedRows[i]);
               // alert("You selected: " + selectedRows[i].Branch_Code__c);
        }
        component.set("v.selectedAccts", setRows);
        
        
    },
    
	handleClick : function(component, event, helper) {
        debugger;
        var branchloop = component.get("v.selectedAccts");
        component.set("v.branchId",branchloop[0].Id);
        
        var action = component.get("c.updateRecord");
        action.setParams({recordId  : component.get('v.recordId'),
                          branchId : component.get('v.branchId')});
        action.setCallback(this, function(response) {
            var state = response.getState();          
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                if(res === 'success'){
                    toastEvent.setParams({
            "title": "Success!",
            "message": "Branch updated",
            "type": "success"
        });
        toastEvent.fire();
                }
                
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } 
                else {
                    console.log(response.getReturnValue());
                }
            }
        });
        $A.enqueueAction(action);
         $A.get('e.force:refreshView').fire();
        //component.set("v.selectedAccts", records);
    }
    
})