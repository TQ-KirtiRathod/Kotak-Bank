({
    doInit : function(component, event, helper) {
         component.set("v.openParentComponent",true); 
    },
	handleChange : function(component, event, helper) {
        debugger;
        var changeValue = event.getParam("value");
       
        if(changeValue === 'option2'){
           component.set("v.boardnote",'boardNote'); 
        }else{
            component.set("v.ue",'ue');
        }
	},
    gotoURL : function(component, event, helper) {
        debugger;
        var ueflow = component.get("v.ue");
        var boardnoteflow = component.get("v.boardnote");
        if(boardnoteflow === 'boardNote'){
            
            component.set("v.openComponent",true); 
            component.set("v.openParentComponent",false); 
        }else{
            component.set("v.UeopenComponent",true); 
            component.set("v.openComponent",false); 
            component.set("v.openParentComponent",false); 
             
           /*  var nagigateLightning = component.find('navigate');
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Case',
                actionName: 'list'
            },
            
        };
        nagigateLightning.navigate(pageReference);*/
          /* var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Case"
    });
    createRecordEvent.fire();
            component.set("v.openParentComponent",false); 
        }*/
        }
    },
    
     hideExampleModal :function(component, event, helper) {
        debugger;
           var evt = $A.get("e.force:navigateToURL");      
    evt.setParams({
          "url": "/lightning/o/Case/list?filterName=Recent"
        
         });

evt.fire();
    } 
})