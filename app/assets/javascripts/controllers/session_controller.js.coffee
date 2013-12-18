Bandango.SessionController = Ember.Controller.extend
  logInAs: (user) ->
    Ember.debug "logging in with token #{user.token}"
    @set "user", user
    $.ajaxSetup
      headers: { "Authorization": "Token token=\"#{user.token}\""}
    window.location.hash = "#/facturas"

  loggedIn: (->
    !!@get("user")
  ).property("user")

Bandango.currentSession = Bandango.SessionController.create()
