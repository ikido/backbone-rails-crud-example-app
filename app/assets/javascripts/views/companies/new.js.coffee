class Phenomena.Views.CompaniesNew extends Phenomena.Views.SharedForm
	initialize: ->
		@options.header = 'Добавление компании'
		@options.success_message = 'Компания успешно добавлена'
		@options.error_message = 'Ошибка. Компания не добавлена.'
		
	success_callback: ->
		@collection.add(@model)
