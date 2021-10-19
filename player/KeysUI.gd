extends Control

export var keys_color_on: Color
export var keys_color_off: Color

func _process(_delta):
	if PlayerGlobal.has_red_key:
		$HBoxContainer/RedKey.modulate = keys_color_on
	else:
		$HBoxContainer/RedKey.modulate = keys_color_off
	
	if PlayerGlobal.has_blue_key:
		$HBoxContainer/BlueKey.modulate = keys_color_on
	else:
		$HBoxContainer/BlueKey.modulate = keys_color_off
