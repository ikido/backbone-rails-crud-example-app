class Phenomena.Models.Company extends Backbone.Model
	schema:
		name: { title: 'Название' },
		phone: { title: 'Телефон' },
		address: { title: 'Адрес' }
		
	urlRoot: '/companies'