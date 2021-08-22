extends Node2D
class_name Weapon

var starting_ammo: int
onready var current_ammo := starting_ammo


func shoot():
	current_ammo -= 1
	PlayerGlobal.emit_signal("gunfire")

