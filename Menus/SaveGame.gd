extends Node
class_name SaveGame

var player_stats := load("res://player/player_stats.tres")

func save_game():
	var save_data := {
		"level" : player_stats.level,
		"sg_ammo" : player_stats.sg_ammo,
		"ar_ammo" : player_stats.ar_ammo,
		"health" : player_stats.health,
		"has_ar" : player_stats.has_ar
	}
	
	var file = File.new()
	file.open("user://save.game", File.WRITE)
	file.store_var(save_data)
	file.close()

func _on_Timer_timeout():
	save_game()
