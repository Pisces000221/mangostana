# 在这里向客户端发布所有的数据库

Meteor.publish 'users', -> Meteor.users.find()
Meteor.publish 'ghouses', -> GM.ghouses.find()
Meteor.publish 'grists', -> GM.grists.find()
Meteor.publish 'messages', -> GM.messages.find()
Meteor.publish 'avatars', -> GM.avatars.find()
