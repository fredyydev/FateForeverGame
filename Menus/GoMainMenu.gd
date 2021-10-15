extends Button



func _on_GoMainMenu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/MainMenu.tscn")
