extends KinematicBody2D
class_name Bullet

export var speed := 100
export var damage := 15
var blood_scene: PackedScene = load("res://enemies/blood_particles/BloodParticles.tscn")

func _physics_process(_delta):
	#the pallet will always move forward
	var _collision := move_and_collide(transform.x * speed)
	#if it collides with anythin in the same layer, it will destroy itself
	if not _collision == null:
		var collider:Node = _collision.collider
		var blood_amount := 0
		if collider is Entity:
			#if collides with enemy, enemy takes damage
			collider.take_damage(damage)
			while blood_amount < 4:
				var blood: RigidBody2D = blood_scene.instance()
				collider.owner.add_child(blood)
				blood.z_index = 2
				blood.global_position = collider.global_position 
				blood.rotation_degrees = rotation_degrees
				blood.play("default")
				
				#randomize amount of blood
				var rng = RandomNumberGenerator.new()
				rng.randomize()
				blood_amount += rng.randf_range(0,4)
				blood.scale = Vector2(1,1) * rng.randf_range(2,5) 
		
		if not collider.is_in_group("bullets"):
			queue_free()


func _on_Timer_timeout():
	queue_free()
