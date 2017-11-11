import { Template } from 'meteor/templating'

Template.game.onCreated ->
  console.log 'created'
Template.game.onRendered ->
  console.log 'rendered'
Template.game.onDestroyed ->
  console.log 'destoyed'
Template.game.events
Template.game.helpers