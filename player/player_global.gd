extends Node

var player_position: Vector2
var current_weapon := "PlayerShotty"

# warning-ignore:unused_signal
signal player_spotted
# warning-ignore:unused_signal
signal player_health_change
# warning-ignore:unused_signal
signal ammo_changed(weapon_name, amount)

func _ready():
	pass #OS.window_size = OS.get_screen_size()
	#OS.window_fullscreen = true
