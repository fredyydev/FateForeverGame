extends Node2D
class_name Weapon

var starting_ammo: int
onready var current_ammo: int setget set_ammo
var can_fire := true

func _ready():
	set_ammo(starting_ammo)

func set_ammo(value):
	current_ammo = value
	PlayerGlobal.emit_signal("ammo_changed", self.name, current_ammo)

func shoot():
	if current_ammo <= 0:
		can_fire = false
	set_ammo(current_ammo - 1)
	PlayerGlobal.emit_signal("player_spotted")
	print(current_ammo)

