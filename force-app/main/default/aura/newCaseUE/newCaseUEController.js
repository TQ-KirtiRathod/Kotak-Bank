({
    //Branch search INIT method
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
    
    //case UE methods
    handleOnSubmit : function(component, event, helper) {
		event.preventDefault();       // stop the form from submitting
        const fields = event.getParam('fields');
        debugger;
        fields.RecordTypeId = '01272000000Aa0bAAC';
        component.find('leadCreateForm').submit(fields);
        debugger;
       
        var toastEvent = $A.get("e.force:showToast");
        debugger;
        toastEvent.setParams({
            "title": "Success!",
            "message": 'Case record has been created successfully.',
            "type": "success"
        });
        toastEvent.fire(); 
    
    },
    
    handleSuccess: function(cmp, event, helper) {
        debugger;
        
        var record = event.getParam("response");
        var myRecordId = record.id; 
        
        var branchloop = cmp.get("v.selectedAccts");
        cmp.set("v.branchId",branchloop[0].Id);
        var action = cmp.get("c.updateRecord");
        action.setParams({
            branchId : cmp.get('v.branchId'),
            recordId : myRecordId
        });
        debugger;
        action.setCallback(this, function(response) {
            var state = response.getState();          
            if (state === "SUCCESS") {
                debugger;
                //   var toastEvent = $A.get("e.force:showToast");
                // var res = response.getReturnValue();
                //if(res === 'success'){
                /*         toastEvent.setParams({
            "title": "Success!",
            "message": "Case created succesfully and Branch is updated.",
            "type": "success"
        });
        toastEvent.fire();
                }*/
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
        
        var params = event.getParams();
        cmp.find("navService").navigate({
            "type": "standard__recordPage",
            "attributes": {
                "recordId": params.response.id,
                "objectApiName": "Case",
                "actionName": "view"
            }
        });
     },
    
    
    
    //Search Components methods
    searchTable : function(cmp,event,helper) {
        var allRecords = cmp.get("v.data");
        var searchFilter = event.getSource().get("v.value").toUpperCase();
        debugger;
        var tempArray = [];
        var i;
        cmp.set("v.filteredData",'');
        if(searchFilter != ''){
            for(i=0; i < allRecords.length; i++){
                debugger
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
        
        cmp.set("v.filteredData",tempArray);
        debugger
        //Checking the data
        if(tempArray.length === 0 ){
           
          /*  var toastEvent= $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error",
                "message": "No Data Found",
            });
            toastEvent.fire();*/
        }
        }else{
            
        cmp.find("branchNameValue").set("v.value", "");
        cmp.find("stateValue").set("v.value", "");
        cmp.find("districtValue").set("v.value", "");
        cmp.find("cityValue").set("v.value", "");
            /*var toastEvent= $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error",
                "message": "No Data Found",
            });
            toastEvent.fire();*/
            
        }
        
    },
    handleSelect: function(component, event, helper){
        debugger;
        var selectedRows = event.getParam('selectedRows'); 
        if(selectedRows.length === 0){
            component.set("v.filteredData",'');
        }else{
        var setRows = [];
        
        for ( var i = 0; i < selectedRows.length; i++ ) {
            setRows.push(selectedRows[i]);
            // alert("You selected: " + selectedRows[i].Branch_Code__c);
        }
        component.set("v.selectedAccts", setRows);
        var branchloop = component.get("v.selectedAccts");
        component.find("branchNameValue").set("v.value", branchloop[0].Name);
        component.find("stateValue").set("v.value", branchloop[0].Sub_Class_Desc__c);
        component.find("districtValue").set("v.value", branchloop[0].District__c);
        component.find("cityValue").set("v.value", branchloop[0].City__c);
        }
    },
    
/*    handleClick : function(component, event, helper) {
        debugger;
        var branchloop = component.get("v.selectedAccts");
        component.set("v.branchId",branchloop[0].Id);
        
        var action = component.get("c.updateRecord");
        action.setParams({
            branchId : component.get('v.branchId'),
            recordId : component.get('v.recordId')
        });
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
        // $A.get('e.force:refreshView').fire();
        //component.set("v.selectedAccts", records);
    }*/
    cancel :function(cmp, event) {
        debugger;
         var evt = $A.get("e.force:navigateToURL");      
    evt.setParams({
          "url":"/lightning/o/Case/list?filterName=Recent"
         });
evt.fire();
    } 
})