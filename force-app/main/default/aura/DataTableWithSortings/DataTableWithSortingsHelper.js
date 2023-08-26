({
  getData: function(component, event, helper) {
    var action = component.get("c.getContacts");
    action.setCallback(this, function(response) {
      var state = response.getState();
      if (state == "SUCCESS") {
        console.log("success");
        component.set("v.data", response.getReturnValue());
        console.log(response.getReturnValue());
      }
    });
    $A.enqueueAction(action);
  },

   sortData: function (cmp, fieldName, sortDirection) {
        var fname = fieldName;
        var data = cmp.get("v.data");
        var reverse = sortDirection !== 'asc';
        data.sort(this.sortBy(fieldName, reverse))
        cmp.set("v.data", data);
    },
    sortBy: function (field, reverse) {
        var key = function(x) {return x[field]};
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
});