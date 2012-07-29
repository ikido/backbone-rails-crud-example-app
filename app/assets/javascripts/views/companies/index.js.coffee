class Phenomena.Views.CompaniesIndex extends Support.CompositeView

	template: HoganTemplates['templates/companies/index']

	initialize: ->
		@collection.on('reset', @render, this)
	
	render: ->
		mustached_companies = []
		
		for company in @collection.models
			company = {
				name: company.get('name')
				address: company.get('address')
				phone: company.get('phone')
			}
			
			mustached_companies.push company	
			
		$(@el).html(@template.render({companies: mustached_companies}, {}))
		this
		
	events:
		'click #add_company' : 'show_add_company_modal'

	show_add_company_modal: (e) ->
		e.preventDefault()
		alert('clicked!')