class Phenomena.Views.CompaniesIndex extends Backbone.View

	template: HoganTemplates['templates/companies/index']
  
	render: ->
		$(@el).html(@template.render({}, {}))
		this