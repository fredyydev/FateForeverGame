extends Node2D
class_name Weapon

var starting_ammo: int
onready var current_ammo := starting_ammo
var can_fire := true

func shoot():
	if current_ammo <= 0:
		can_fire = false
	current_ammo -= 1
	PlayerGlobal.emit_signal("player_spotted")

