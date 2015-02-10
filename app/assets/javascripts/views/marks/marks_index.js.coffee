class Bookmarkr.Views.MarksIndex extends Backbone.View

  template: JST['marks/index']

  initialize: ->
    @collection.on('change', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendMark)
    this

  appendMark: (mark) ->
    console.log("appendMark: " + mark)
    view = new Bookmarkr.Views.Mark(model: mark)
    $('#marks_display').append(view.render().el)
