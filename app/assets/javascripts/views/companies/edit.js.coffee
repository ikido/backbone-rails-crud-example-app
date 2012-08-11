class Phenomena.Views.CompaniesEdit extends Phenomena.Views.SharedForm
	initialize: ->
		@options.header = 'Редактирование компании'
		@options.success_message = 'Компания успешно сохранена'
		@options.error_message = 'Ошибка. Компания не сохранена.'
