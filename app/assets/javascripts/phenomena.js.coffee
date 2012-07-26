window.Phenomena =
	Models: {}
	Collections: {}
	Views: {}
	Routers: {}
	init: ->
		new Phenomena.Routers.Companies()
		Backbone.history.start()

$(document).ready ->
	Phenomena.init()
