Meteor.methods
  addEvent: ({from, to, label}) ->
    if @userId?
      CalandarItem.insert({from, to, label})
