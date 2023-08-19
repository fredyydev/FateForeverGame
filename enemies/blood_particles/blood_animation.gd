extends RigidBody2D

var animate := true
var rng := RandomNumberGenerator.new()
onready var anim = $BloodParticles/AnimDuration

func play(_string = "default", _boolean = false):
	rng.randomize()
	
	self.position.x += rng.randf_range(-30, 30)
	self.position.y += rng.randf_range(-30, 30)
	self.rotation_degrees += rng.randf_range(10, 10)
	$BloodParticles.rotation_degrees += rng.randf_range(-360, 360)	
	$BloodParticles.scale = Vector2.ONE * rng.randf_range(.7,4.666)
	
	anim.wait_time = rng.randf_range(0.1, 0.5666)
	anim.start()
	$BloodParticles.play()
	

func _physics_process(_delta):
	if animate:
		self.global_position += transform.x * 10


func _on_AnimDuration_timeout():
	animate = false
