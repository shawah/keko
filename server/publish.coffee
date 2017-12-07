import moment from 'moment'

Meteor.publish
  events: (date)->
    CalandarItem.find
      from:
        $gte:moment(date).startOf('day').toDate()
        $lte:moment(date).endOf('day').toDate()