({
	fetchTco : function(component, event, helper) {
		var action = component.get("c.getContacts");
        var tcoId = component.get("v.recordID");
        action.setParams({
            recordIds : tcoId
        });
        action.setCallback(this, function(response){
                           var state= response.getState();
            if(state === 'SUCESS'){
                var tcoList = response.getReturnValue();
                console.log(tcoList);
            }
            else
            {
                alert('Error in getting data');
            }
                           });
        $A.enqueueAction(action);
	}
})