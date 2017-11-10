import { Template } from 'meteor/templating'

Template.description.onCreated ->
  console.log 'created'
Template.description.onRendered ->
  console.log 'rendered'
Template.description.onDestroyed ->
  console.log 'destoyed'
Template.description.events
  'click h2':->
    console.log 'click on h2'
  'mouseover h1':->
    console.log 'mouse over h1'
Template.description.helpers
  topkek:->
    return "SALUT CA VA ?"
  userLoggedIn:->
    Meteor.userId()?
  listOfNumbers:->
    [1..10]
