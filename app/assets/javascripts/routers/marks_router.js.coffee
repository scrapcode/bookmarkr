class Bookmarkr.Routers.Marks extends Backbone.Router

  routes:
    '': 'index'
    'marks/:id': 'show'

  initialize: ->
    @collection = new Bookmarkr.Collections.Marks()
    @collection.fetch()

  index: ->
    @marksIndexView = new Bookmarkr.Views.MarksIndex
      el: $('#marks_table'),
      collection: @collection,
      router: this
    @marksIndexView.render()

  show: (id) ->
    alert "Showing #{id}"
