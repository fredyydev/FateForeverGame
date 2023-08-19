extends RayCast2D

var current_owner = owner as Enemy
var speed = 70

func _physics_process(_delta):
	if get_collider() != null:
		owner.move_and_slide( get_collision_normal() * speed) 


