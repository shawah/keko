import { Template } from 'meteor/templating'

Template.description.onCreated ->
  console.log 'created'
Template.description.onRendered ->
  console.log 'rendered'
Template.description.onDestroyed ->
  console.log 'destoyed'
Template.description.events
  'click #check':->
    console.log $("#username").val()
    console.log $("#password").val()
Template.description.helpers
  topkek:->
    return "SALUT CA VA ?"
  userLoggedIn:->
    Meteor.userId()?
  listOfNumbers:->
    [1..10]
