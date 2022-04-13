({
    onPicklistChange : function(component, event, helper) {
        debugger;
        var level1 = component.find("levelValue").get("v.value");
        if(level1 === '1'){
            component.set("v.displaylevel1",true);
            component.set("v.displaylevel2",false);
             component.set("v.displaylevel3",false);
             component.set("v.displaylevel4",false);
             component.set("v.displaylevel5",false);
        }else if(level1 === '2'){
            component.set("v.displaylevel1",true);
            component.set("v.displaylevel2",true); 
            component.set("v.displaylevel3",false);
            component.set("v.displaylevel4",false);
             component.set("v.displaylevel5",false);
        }else if(level1 === '3'){
            component.set("v.displaylevel1",true);
            component.set("v.displaylevel2",true); 
            component.set("v.displaylevel3",true);
            component.set("v.displaylevel4",false);
              component.set("v.displaylevel5",false);
        }else if(level1 === '4'){
            component.set("v.displaylevel1",true);
            component.set("v.displaylevel2",true);
            component.set("v.displaylevel3",true);
            component.set("v.displaylevel4",true);
            component.set("v.displaylevel5",false);
        }else if(level1 === '5'){
            component.set("v.displaylevel1",true);
            component.set("v.displaylevel2",true);
            component.set("v.displaylevel3",true);
            component.set("v.displaylevel4",true);
            component.set("v.displaylevel5",true);
        }
        
    },
    onLevel1approver1Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level1Value").get("v.value");
        component.set("v.level1approver1",level1Value);
    },
    onLevel1approver2Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level2Value").get("v.value");
        component.set("v.level1approver2",level1Value);
    },
    onLevel1approver3Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level3Value").get("v.value");
        component.set("v.level1approver3",level1Value);
    },
    onLevel1approver4Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level4Value").get("v.value");
        component.set("v.level1approver4",level1Value);
    },
    
    onLevel2approver1Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level11Value").get("v.value");
        component.set("v.level2approver1",level1Value);
    },
    onLevel2approver2Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level22Value").get("v.value");
        component.set("v.level2approver2",level1Value);
    },
    onLevel2approver3Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level33Value").get("v.value");
        component.set("v.level2approver3",level1Value);
    },
    onLevel2approver4Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level44Value").get("v.value");
        component.set("v.level2approver4",level1Value);
    },
    
    
    onLevel3approver1Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level111Value").get("v.value");
        component.set("v.level3approver1",level1Value);
    },
    onLevel3approver2Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level222Value").get("v.value");
        component.set("v.level3approver2",level1Value);
    },
    onLevel3approver3Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level333Value").get("v.value");
        component.set("v.level3approver3",level1Value);
    },
    onLevel3approver4Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level444Value").get("v.value");
        component.set("v.level3approver4",level1Value);
    },
    
    onLevel4approver1Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level1111Value").get("v.value");
        component.set("v.level4approver1",level1Value);
    },
    onLevel4approver2Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level2222Value").get("v.value");
        component.set("v.level4approver2",level1Value);
    },
    onLevel4approver3Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level3333Value").get("v.value");
        component.set("v.level4approver3",level1Value);
    },
    onLevel4approver4Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level4444Value").get("v.value");
        component.set("v.level4approver4",level1Value);
    },
    
    onLevel5approver1Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level11111Value").get("v.value");
        component.set("v.level5approver1",level1Value);
    },
    onLevel5approver2Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level22222Value").get("v.value");
        component.set("v.level5approver2",level1Value);
    },
    onLevel5approver3Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level33333Value").get("v.value");
        component.set("v.level5approver3",level1Value);
    },
    onLevel5approver4Change : function(component, event, helper) {
        debugger;
        var level1Value = component.find("level44444Value").get("v.value");
        component.set("v.level5approver4",level1Value);
    },
    handleOnSubmit : function(component, event, helper) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.getParam('fields');
        
        fields.RecordTypeId = '01272000000AaobAAC';
        component.find('leadCreateForm').submit(fields);
         var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Please provide TCO and Business unit data to move the case in Under Review status.",
            "type": "success"
        });
        toastEvent.fire();
        
     
    },
    handleSuccess: function(cmp, event, helper) {
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
    cancel :function(cmp, event) {
        debugger;
         var evt = $A.get("e.force:navigateToURL");      
    evt.setParams({
          "url": "/lightning/o/Case/list?filterName=Recent"
        
         });

evt.fire();
    } 
          /* var evt = $A.get("e.force:navigateToURL");      
    evt.setParams({
          "url": "lightning/o/Case/list?filterName=Recent"
     //componentDef:"c:NewOpportunityCreation"
    });

evt.fire();
    } */
        
    })