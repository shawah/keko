import { Template } from 'meteor/templating'

Template.calendar.onCreated ->
  console.log 'created'
Template.calendar.onRendered ->
  console.log 'rendered'
Template.calendar.onDestroyed ->
  console.log 'destoyed'
Template.calendar.events
	'click #addevent':->
		console.log $("#addeventtext").val()
Template.calendar.helpers
	days:->
		[
			{
				label:'Monday'
				size:2
			}
			{
				label:'Tuesday'
				size:2
			}
			{
				label:'Wednesday'
				size:2
			}
			{
				label:'Thursday'
				size:2
			}
			{
				label:'Friday'
				size:2
			}
			{
				label:'Saturday'
				size:1
			}
			{
				label:'Sunday'
				size:1
			}
		]