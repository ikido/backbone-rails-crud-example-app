class Phenomena.View extends Support.CompositeView
	# This is Support.CompositeView by thoughtbot, wich in turn
	# extends default Backbone view, with some additional sugar,
	# 
	# Functions:
	#
	# prepend_and_fade_alert(container, text, type)
	#
	# Prepends an alert to specified container, then fades it awawy
	# and removes
	
	prepend_and_fade_alert: (container, text, type) -> 
		# show alert
		alert_template = HoganTemplates['templates/shared/alert']
		alert_id = (new Date).getTime()
		alert_html = alert_template.render({ text: text, id: alert_id, type: type }, {})
		container.prepend(alert_html)
		
		# slowly fade out & remove alert
		$('#'+alert_id).fadeOut(4000, ->
			$(this).remove()
		)