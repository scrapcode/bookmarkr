class Bookmarkr.Views.Mark extends Backbone.View
  template: JST['marks/mark']
  tagName: 'tr'

  initialize: ->
    console.log("[i] mark.js.coffee initialized")
    @model.on('change', @render, this)

  render: ->
    $(@el).html(@template(mark: @model))
    this
