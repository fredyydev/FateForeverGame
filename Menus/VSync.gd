extends Control

var vsync_save := true

func _process(_delta):
	$VsyncCheckBox.pressed = OS.vsync_enabled
	vsync_save = $VsyncCheckBox.pressed


func _on_VsyncCheckBox_pressed():
	match OS.vsync_enabled:
		true:
			OS.vsync_enabled = false
			vsync_save = false
		false:
			OS.vsync_enabled = true
			vsync_save = true

