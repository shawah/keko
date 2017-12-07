import { Template } from 'meteor/templating'
import moment from 'moment'

Template.calendar.onCreated ->
  console.log 'created'
Template.calendar.onRendered ->
  console.log 'rendered'
Template.calendar.onDestroyed ->
  console.log 'destoyed'
Template.calendar.events
Template.calendar.helpers
	days:->
		now = moment().startOf 'week'
		now.add 1, 'day'
		days = []
		for i in [0...7*2]
			if now.day() != 0
				days.push
					date: moment(now)
					label: now.format 'ddd DD MMM'
			now.add 1, 'day'
		days