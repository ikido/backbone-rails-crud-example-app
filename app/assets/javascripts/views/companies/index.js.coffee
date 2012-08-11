class Phenomena.Views.CompaniesIndex extends Phenomena.View

	template: HoganTemplates['templates/companies/index']

	initialize: ->
		@collection.on('reset', @render, this)
		@collection.on('add', @renderNewCompany, this)
	
	render: ->
		$(@el).html(@template.render({}, {}))
		
		current_view = this
		@collection.each (company) ->
			view = new Phenomena.Views.CompaniesShow(model: company)
			current_view.appendChildTo(view, current_view.$('#companies'))
		
		this
		
	events:
		'click #add_company' : 'show_add_company_modal'

	show_add_company_modal: (e) ->
		e.preventDefault()
		view = new Phenomena.Views.CompaniesNew(model: new Phenomena.Models.Company, collection: @collection)
		@.appendChild(view)
		$('#form_modal').modal()
		
	renderNewCompany: (company) ->
		view = new Phenomena.Views.CompaniesShow(model: company)
		@prependChildTo(view, @$('#companies'))
		