class Phenomena.Routers.Companies extends Support.SwappingRouter
	routes:
		'': 'index'
		
	initialize: ->
		@collection = new Phenomena.Collections.Companies()
		@collection.fetch()
		
		this.el = $("#container")

	index: ->
		view = new Phenomena.Views.CompaniesIndex(collection: @collection)
		this.swap(view)