extends Control


func _process(_delta):
	$CheckBox.pressed = OS.window_fullscreen

func _on_CheckBox_pressed():
	match OS.window_fullscreen:
		true:
			OS.window_fullscreen = false
			OS.window_size = Vector2(1240,720) 
		false:
			OS.window_fullscreen = true
			OS.window_size = OS.get_screen_size()
