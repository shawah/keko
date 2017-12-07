Router.configure
  loadingTemplate: 'spinner'
Router._routes=[
  {
    path: '/'
    name: 'home'
    template: 'description'
    title: 'Home'
    data: null
    waitOn: null
    layoutTemplate: 'home'
    onAfterAction:->
      window.document.title = "KEKO"
  }
]
Router.map ->
  Router._routes.forEach (r)=>
    @route r.path, r