Meteor.startup ->
  Error.stackTraceLimit=Infinity
  admin=Meteor.users.findOne({username:'admin'})
  unless admin?
    Accounts.createUser({username:'admin',password:'123456admin'})
    admin=Meteor.users.findOne({username:'admin'})
  unless Roles.userIsInRole(admin._id,['admin'])
    Roles.setUserRoles(admin._id,['admin'])
  unless Roles.userIsInRole(admin._id,['user'])
    Roles.setUserRoles(admin._id,['user'])
  roles=Roles.getAllRoles().fetch()
  basicRoles=['user']
  for br in basicRoles
    unless _.find(roles,(d)->d.name==br)
      Roles.createRole(br)