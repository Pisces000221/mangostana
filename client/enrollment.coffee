Meteor.subscribe 'users'
Session.setDefault 'enroll_msg', ''
Session.setDefault 'enroll_in_progress', false

Template.enrollment.helpers
  'email': -> Meteor.users.findOne(this.trim()).emails[0].address
  'message': -> Session.get 'enroll_msg'
  'in_progress': -> Session.get 'enroll_in_progress'

Template.enrollment.events
  'click #btn_submit': ->
    Session.set 'enroll_msg', ''
    Session.set 'enroll_in_progress', true
    # https://developer.mozilla.org/en-US/docs/Web/API/FileReader.readAsDataURL
    # http://blog.teamtreehouse.com/reading-files-using-the-html5-filereader-api
    file = document.getElementById('file_avatar').files[0]
    reader = new FileReader()
    current_id = this.trim()

    username = document.getElementById('txt_username').value
    password = document.getElementById('txt_password').value
    rpt_password = document.getElementById('txt_rptpassword').value
    if password isnt rpt_password
      Session.set 'enroll_msg', '看上去你手抖了……赶紧重新输入一遍密码'
      Session.set 'enroll_in_progress', false
      return
    else if not document.getElementById('chk_agreement').checked
      Session.set 'enroll_msg', '先要同意《没有》才可以继续'
      Session.set 'enroll_in_progress', false
      return

    reader.onloadend = ->
      # 文件加载完成（或者根本没有加载），准备出发
      GM.enroll current_id, {
        username: username
        password: password
        avatar: reader.result
      }, (err, result) ->
        if err then Session.set 'enroll_msg', "出了点问题…… #{err.toString()}"
        else
          Meteor.loginWithPassword id: current_id, password
          Router.go '/'
        Session.set 'enroll_in_progress', false

    if file
      reader.readAsDataURL file
    else
      reader.onloadend()
