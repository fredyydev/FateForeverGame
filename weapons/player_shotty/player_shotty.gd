extends Weapon

var player_stats := load("res://player/player_stats.tres")
export(PackedScene) var pallet_scene: PackedScene 
export(NodePath) onready var pallets = get_node(pallets) as Node2D

func _ready():
	starting_ammo = player_stats.sg_ammo
	#we call the parent class' ready function after this one
	._ready()

func _process(_delta):
	if Input.is_action_pressed("shoot") and can_fire:
		$FireRate.start()
		if current_ammo > 0:
			shoot()


func shoot():
	.shoot()
	$shot_animation.play("shoot")
	$Gun_Sound.play()
	can_fire = false
	for child in pallets.get_children():
		var pallet: Node2D = pallet_scene.instance()
		pallet.global_rotation_degrees = child.global_rotation_degrees
		pallet.global_position = child.global_position
		owner.owner.add_child(pallet)
	player_stats.sg_ammo = current_ammo


func _on_FireRate_timeout():
	can_fire = true
