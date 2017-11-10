Template.nav.helpers
  menuItems:->
    Router._routes
  isActive:->
    if Router.current().route.getName()==@name
      return 'active'
