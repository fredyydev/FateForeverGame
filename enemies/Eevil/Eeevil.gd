extends Enemy
class_name Eeevil

export(PackedScene) onready var projectile_scene = projectile_scene as PackedScene

func attack():
	$attack_sound.play()
	var projectile: Bullet = projectile_scene.instance()
	projectile.global_rotation = self.global_rotation
	projectile.global_position = $bullet_spawn.global_position
	owner.add_child(projectile)


func _on_DetectionArea_body_entered(body):
	if body is Player:
		PlayerGlobal.emit_signal("player_spotted")
