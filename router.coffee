# Configure iron:router

Router.map ->
  @route 'home_page',
    path: '/'
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
  @route 'enrollment',
    path: '/enroll/:user_id/:token'
    data: -> user_id: @params.user_id.trim(), token: @params.token.trim()
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
  @route 'man_grists',
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
  @route 'edit_grist',
    path: '/edit_grist/:id'
    data: -> GM.grists.findOne @params.id
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
  @route 'ghouse',
    path: '/ghouse/:id'
    data: -> GM.ghouses.findOne @params.id
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
  @route 'edit_ghouse',
    path: '/edit_ghouse/:id'
    data: -> GM.ghouses.findOne @params.id
    layoutTemplate: 'layout'
    yieldTemplates: 'header': to: 'top'
