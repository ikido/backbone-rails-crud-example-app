class Phenomena.Collections.Companies extends Backbone.Collection
	url: '/companies'
	
	model: Phenomena.Models.Company
	
	comparator: (company) ->
		date = new Date(company.get('created_at'))
		-date.getTime()
