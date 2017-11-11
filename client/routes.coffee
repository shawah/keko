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
      window.document.title = "KEKO "
  }
  {
    path: '/game'
    name: 'game'
    template: 'game'
    title: 'Game'
    data: null
    waitOn: null
    layoutTemplate: 'home'
    onAfterAction:->
      window.document.title = "KEKO GAME"
  }
]
Router.map ->
  Router._routes.forEach (r)=>
    @route r.path, r