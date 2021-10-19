extends Weapon
class_name OneKiller

var player_stats := load("res://player/player_stats.tres")
export(PackedScene) var bullet_scene: PackedScene 
export(PackedScene) var shot_scene: PackedScene

func _ready():
	set_process(false)
	current_ammo = 99999

func _process(_delta):
	if Input.is_action_pressed("shoot") and can_fire:
		$FireRate.start()
		if current_ammo > 0:
			shoot()

func shoot():
	.shoot()
	play_shot_sound()
	$anim.play("shot")
	can_fire = false
	var bullet: Node2D = bullet_scene.instance()
	bullet.global_rotation_degrees = $bullet_spawn.global_rotation_degrees
	bullet.global_position = $bullet_spawn.global_position
	owner.owner.add_child(bullet)

func play_shot_sound():
	var shot_sound = shot_scene.instance()
	add_child(shot_sound)


func _on_FireRate_timeout():
	can_fire = true
