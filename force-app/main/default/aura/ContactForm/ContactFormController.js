({
	searchContactList : function(component, event, helper) {
		let searchEvent =  component.getEvent("searchContact");
        console.log(searchEvent);
        var con =  component.get("v.newExpense");
        console.log(con);
        searchEvent.setParam({
            allContacts : con
        });
        searchEvent.fire();
	}
})