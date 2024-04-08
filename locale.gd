extends Node

var langKey = 00

func _ready():
	# use and display english as default locale 
	# to save resources finding the language in the first run
	TranslationServer.set_locale("en")
	_set_Locale()

func _on_Button_pressed():
	langKey += 1
	if langKey > 2 : # Keep the key value in language bounds
		langKey = 0
	_set_Locale()

func _set_Locale():
	match langKey:
		00: 
			TranslationServer.set_locale("en")
		01: 
			TranslationServer.set_locale("es")
		02: 
			TranslationServer.set_locale("ja")

	var langCode = "LANGUAGE0" + str(langKey)
	get_node("VBoxContainer/Label").text = tr("LANGUAGEID")
	get_node("VBoxContainer/Button").text = tr(langCode)
	
