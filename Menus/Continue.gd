extends Button

var file = File.new()
var player_stats = load("res://player/player_stats.tres")

func _ready():
	if file.file_exists("user://save.game"):
		self.disabled = false

func load_game():
	if file.file_exists("user://save.game"):
		file.open("user://save.game", File.READ)
		var loaded_data = file.get_var()
		file.close()
		
		player_stats.health = loaded_data["health"]
		player_stats.sg_ammo = loaded_data["sg_ammo"]
		player_stats.ar_ammo = loaded_data["ar_ammo"]
		player_stats.has_ar = loaded_data["has_ar"]
		
		var level = loaded_data["level"]
		#Load the level based on the name 
		
		match level:
			"Level1":
				# warning-ignore:return_value_discarded
				get_tree().change_scene("res://levels/level1/Level1.tscn")
			"Level2":
				# warning-ignore:return_value_discarded
				get_tree().change_scene("res://levels/level2/Level2.tscn")
			_:
				print("error: level not found")

func _on_Continue_pressed():
	load_game()
