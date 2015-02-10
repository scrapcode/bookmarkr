window.Bookmarkr =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Bookmarkr.Routers.Marks()
    Backbone.history.start()

$(document).ready ->
  Bookmarkr.initialize()
