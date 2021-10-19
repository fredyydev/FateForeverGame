extends Control

func save_settings():
	var data := {
		"vsync" : $CenterAnchor/Buttons/VSync.vsync_save,
		"fullscreen" : $CenterAnchor/Buttons/Fullscreen.fullscreen_save,
		"volume" : $CenterAnchor/Buttons/Volume/VolumeHSlider.volume_save
	}
	var save_file = File.new()
	save_file.open(PlayerGlobal.settings_file_path, File.WRITE)
	save_file.store_var(data)
	save_file.close()




func _on_SAVES_SET_pressed():
	save_settings()
