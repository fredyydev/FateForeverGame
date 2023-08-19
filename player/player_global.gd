extends Node

var player_position: Vector2
var player_health: float
var current_weapon := "PlayerShotty"
var settings_path := "user://settings/"
#Fun fact: HAD stands for "Here's All the Data". Now, did you catch the reference?
var settings_file_path := "user://settings/settings.had"
var has_blue_key: bool
var has_red_key: bool

# warning-ignore:unused_signal
signal player_spotted
# warning-ignore:unused_signal
signal player_health_change
# warning-ignore:unused_signal
signal ammo_changed(weapon_name, amount)

func _ready():
	load_settings()

func load_settings():
	var dir = Directory.new()
	
	if !dir.dir_exists(settings_path):
		dir.make_dir_recursive(settings_path)
	else:
		var save_file := File.new()
		
		if save_file.file_exists(settings_file_path):
# warning-ignore:return_value_discarded
			save_file.open(settings_file_path, File.READ)
			var loaded_data = save_file.get_var()
			save_file.close()
			
			OS.window_fullscreen = loaded_data["fullscreen"]
			OS.vsync_enabled = loaded_data["vsync"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), loaded_data["volume"])
			
