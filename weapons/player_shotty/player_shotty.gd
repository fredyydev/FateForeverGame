extends Weapon

var player_stats := load("res://player/player_stats.tres")
export(PackedScene) var pallet_scene: PackedScene 
export(NodePath) onready var pallets = get_node(pallets) as Node2D

func _init():
	starting_ammo = player_stats.init_shotgun_ammo

func _process(_delta):
	if Input.is_action_pressed("shoot") and can_fire:
		shoot()

func shoot():
	.shoot()
	$FireRate.start()
	can_fire = false
	for child in pallets.get_children():
		var pallet: Node2D = pallet_scene.instance()
		pallet.global_rotation_degrees = child.global_rotation_degrees
		pallet.global_position = child.global_position
		owner.owner.add_child(pallet)




func _on_FireRate_timeout():
	if current_ammo > 0:
		can_fire = true
