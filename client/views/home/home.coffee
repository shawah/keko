import { Template } from 'meteor/templating'

Template.home.onCreated ->
  console.log 'created'
Template.home.onRendered ->
  console.log 'rendered'
Template.home.onDestroyed ->
  console.log 'destoyed'
Template.home.events
Template.home.helpers