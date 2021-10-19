extends Button

var player_stats := load("res://player/player_stats.tres")

func _on_Play_pressed():
	player_stats.reset()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://levels/level1/Level1.tscn")
	Engine.time_scale = 1
