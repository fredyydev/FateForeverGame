extends Button



func _on_GoMainMenu_pressed():
	Engine.time_scale = 1
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/MainMenu.tscn")
