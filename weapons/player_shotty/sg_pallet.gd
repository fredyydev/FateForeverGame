extends KinematicBody2D
class_name Bullet

export var speed := 25
export var damage := 15

func _process(_delta):
	#the pallet will always move forward
	var _collision := move_and_collide(transform.x * speed)
	#if it collides with anythin in the same layer, it will destroy itself
	if not _collision == null:
		var collider:Node = _collision.collider
		if collider is Enemy:
			#if collides with enemy, enemy takes damage
			collider.take_damage(damage)	
		if not collider.is_in_group("bullets"):
			queue_free()


func _on_Timer_timeout():
	queue_free()
