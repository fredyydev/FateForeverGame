extends Control

func _process(_delta):
	$CheckBox.pressed = OS.vsync_enabled

func _on_CheckBox_pressed():
	match OS.vsync_enabled:
		true:
			OS.vsync_enabled = false
		false:
			OS.vsync_enabled = true
