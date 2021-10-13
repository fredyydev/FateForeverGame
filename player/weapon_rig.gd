extends Node2D
class_name WeaponRig

onready var shotty = $PlayerShotty
onready var current_weapon = shotty

func _unhandled_input(_event):
	if Input.is_action_just_pressed("shotgun"):
		switch_weapon("PlayerShotty")
	if Input.is_action_just_pressed("machine_gun"):
		if owner.has_machine_gun != true:
			return
		switch_weapon("MachineGun")

func switch_weapon(weapon_name: String):
	var selected_weapon = get_node(weapon_name)
	
	for child in get_children():
		if child.get_index() == selected_weapon.get_index():
			if current_weapon == selected_weapon:
				return
			current_weapon = selected_weapon
			selected_weapon.visible = true
			selected_weapon.set_process(true)
		else:
			child.visible = false
			child.set_process(false)
