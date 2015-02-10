class Bookmarkr.Views.MarksIndex extends Backbone.View

  template: JST['marks/index']

  initialize: ->
    console.log("[i] marks_index.js.coffee initialized")
    @collection.on('all', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendMark)
    this

  appendMark: (mark) ->
    console.log("appendMark: " + mark)
    view = new Bookmarkr.Views.Mark(model: mark)
    $('#marks_display').append(view.render().el)
