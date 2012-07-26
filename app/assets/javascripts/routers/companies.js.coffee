class Phenomena.Routers.Companies extends Backbone.Router
	routes:
		'': 'index'
		'companies/:id': 'show'

	index: ->
		view = new Phenomena.Views.CompaniesIndex()
		$('#container').html(view.render().el)
		
	show: (id) ->
		alert "Company #{id}"