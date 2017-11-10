routes=[
  {
    path:'/'
    name:'home'
    template:'home'
    title:'Home'
  }
]
Router.map ->
  routes.forEach (r)=>
    @route r.path,
      name:r.name
      template:r.template
      data:r.data
      waitOn:r.waitOn
      layoutTemplate:r.layoutTemplate
      onAfterAction:->
        window.document.title = r.title
