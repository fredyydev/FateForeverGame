extends AnimatedSprite

var animate := true
var rng := RandomNumberGenerator.new()

func play(_string = "default", _boolean = false):
	.play()
	rng.randomize()
	$AnimDuration.wait_time = rng.randf_range(0.1, 0.2666)
	$AnimDuration.start()

func _physics_process(_delta):
	if animate:
		self.global_position += transform.x * 4


func _on_AnimDuration_timeout():
	animate = false
