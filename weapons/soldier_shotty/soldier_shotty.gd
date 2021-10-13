extends Weapon


export(PackedScene) var pallet_scene: PackedScene 
export(NodePath) onready var pallets = get_node(pallets) as Node2D

func _init():
	starting_ammo = 666

func shoot():
	$gun_shot.play()
	$shot_anim.play("shot")
	.shoot()
	
	for child in pallets.get_children():
		var pallet: Node2D = pallet_scene.instance()
		pallet.global_rotation_degrees = child.global_rotation_degrees
		pallet.global_position = child.global_position
		owner.owner.add_child(pallet)
