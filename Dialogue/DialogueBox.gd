extends Node



var dialog = [
	'GREETINGS00',
	'GREETINGS01',
	'GREETINGS02'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$CanvasLayer/TextureRect/Label.text = dialog[dialog_index]
		$CanvasLayer/TextureRect/Label.percent_visible = 0
		$CanvasLayer/Tween.interpolate_property($CanvasLayer/TextureRect/Label, "percent_visible",0,1,1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$CanvasLayer/Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(_object, _key):
	finished = true
