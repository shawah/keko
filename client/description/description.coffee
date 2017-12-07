import { Template } from 'meteor/templating'

Template.description.onCreated ->
  console.log 'created'
Template.description.onRendered ->
  console.log 'rendered'
Template.description.onDestroyed ->
  console.log 'destoyed'
Template.description.events
Template.description.helpers
  userLoggedIn:->
    Meteor.userId()?
