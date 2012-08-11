class Phenomena.Views.CompaniesShow extends Phenomena.View
	
	template: HoganTemplates['templates/companies/show']
	
	tagName: 'tr'
	
	initialize: ->
		@model.on('change', @render, this)
		@model.on('destroy', @leave, this)
	
	render: ->
		$(@el).html(@template.render({ 
			name: @model.get('name'),
			phone: @model.get('phone'),
			address: @model.get('address')
			id: @model.id
		}, {}))
		
		this
		
	events:
		'click .edit_company' : 'show_edit_company_modal'
		'click .destroy_company' : 'destroy_company'
		
	show_edit_company_modal: (e) ->
		e.preventDefault()
		view = new Phenomena.Views.CompaniesEdit(model: @model)
		@.parent.appendChild(view)
		$('#form_modal').modal()
		
	destroy_company: (e) ->
		e.preventDefault()
		current_view = @

		@model.destroy({
			wait: true
			success: ->
				current_view.prepend_and_fade_alert($(current_view.parent.el), 'Компания успешно удалена', 'success')

			error: (model, response) ->
				current_view.prepend_and_fade_alert($(current_view.parent.el), 'Ошибка. Компани не удалена', 'error')
		})