import SimpleSchema from 'simpl-schema'
SimpleSchema.extendOptions(['index', 'unique', 'denyInsert', 'denyUpdate'])

@CalandarItem = new Mongo.Collection('events')
CalandarItem.attachSchema new SimpleSchema
  label:
    type:String
  from:
    type:Date
  to:
    type:Date
  createdBy:
    type:String
    autoValue:->Meteor.userId()
    denyUpdate:true
  createdByUsername:
    type:String
    autoValue:->Meteor.user().username
    denyUpdate:true
  createdAt:
    type:Date
    autoValue:->new Date
    denyUpdate:true
  updatedAt:
    type:Date
    autoValue:->new Date
    denyInsert:true
CalandarItem.allow
  insert:(userId, doc)->
    userId?
  update:(userId, doc)->
    userId?
  remove:(userId, doc)->
    userId?
