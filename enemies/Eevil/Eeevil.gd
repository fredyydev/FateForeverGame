extends Enemy
class_name Eevil

export(PackedScene) onready var projectile_scene = projectile_scene as PackedScene

func attack():
	var projectile: Bullet = projectile_scene.instance()
	projectile.global_rotation = self.global_rotation
	projectile.global_position = $bullet_spawn.global_position
	owner.add_child(projectile)
