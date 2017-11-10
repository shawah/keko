Router.configure
  loadingTemplate: 'spinner'
Router._routes=[
  {
    path: '/'
    name: 'home'
    template: 'home'
    title: 'Home'
    data: null
    waitOn: null
    layoutTemplate: null
    onAfterAction:->
      window.document.title = "KEKO "
  }
]
Router.map ->
  Router._routes.forEach (r)=>
    @route r.path, r