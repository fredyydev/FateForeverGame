extends Control

var fullscreen_save: bool

func _process(_delta):
	$checkBox.pressed = OS.window_fullscreen
	fullscreen_save = $checkBox.pressed


func _on_checkBox_pressed():
	match OS.window_fullscreen:
		true:
			fullscreen_save = false
			OS.window_fullscreen = false
			OS.window_size = Vector2(1240,720) 
	
		false:
			fullscreen_save = true
			OS.window_fullscreen = true
			OS.window_size = OS.get_screen_size()
