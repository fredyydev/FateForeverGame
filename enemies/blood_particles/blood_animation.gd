extends RigidBody2D

var animate := true
var rng := RandomNumberGenerator.new()
onready var anim = $BloodParticles/AnimDuration

func play(_string = "default", _boolean = false):
	$BloodParticles.play()
	rng.randomize()
	anim.wait_time = rng.randf_range(0.1, 0.2666)
	anim.start()

func _physics_process(_delta):
	if animate:
		self.global_position += transform.x * 10


func _on_AnimDuration_timeout():
	animate = false
