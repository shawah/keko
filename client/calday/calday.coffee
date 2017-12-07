import { Template } from 'meteor/templating'
import moment from 'moment'
import swal from 'sweetalert2'

Template.calday.onCreated ->
  @autorun =>
    @subscribe 'events',Template.instance().data.date.toDate()
Template.calday.onRendered ->
Template.calday.onDestroyed ->
Template.calday.events
  'click [role="add"]':->
    from = await swal
      title: "#{@date.format('ddd DD MMM')} from ?"
      text: 'For example 09:00 or 18:30'
      input: 'text'
    return if !from.value
    return if !/[0-2][0-9]:[0-5][0-9]/.test from.value
    to = await swal
      title: "#{@date.format('ddd DD MMM')} #{from.value} to ?"
      text: 'For example 09:00 or 18:30'
      input: 'text'
    return if !to.value
    return if !/[0-2][0-9]:[0-5][0-9]/.test to.value
    label = await swal
      title: "#{@date.format('ddd DD MMM')} #{from.value} to #{to.value} - Note ?"
      text: 'For example babysitting'
      input: 'text'
    from = from.value.split(':').map((d)->d-0)
    to = to.value.split(':').map((d)->d-0)
    label = label.value
    from = moment(@date).set('hours',from[0]).set('minutes',from[1])
    to = moment(@date).set('hours',to[0]).set('minutes',to[1])
    console.log from, to, label
    console.log Meteor.call 'addEvent', {from:from.toDate(), to:to.toDate(), label}
  'click [role="remove"]':->
    res = await swal
      title: 'Are you sure ?'
      text: "You won't be able to revert this!"
      type: 'warning'
      showCancelButton: true
    if !!res.value
      CalandarItem.remove _id:@_id
Template.calday.helpers
  events:->
    CalandarItem.find {
      from:
        $gte:moment(@date).startOf('day').toDate()
        $lte:moment(@date).endOf('day').toDate()
    },{
      sort:
        from:1
    }
  fromH:->
    moment(@from).format('HH:MM')
  toH:->
    moment(@to).format('HH:MM')