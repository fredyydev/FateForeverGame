extends PlayerState

export var dash_speed := 500.0
var dash_dir : Vector2

func enter(md := {}):
	dash_dir = md["dir"]
	player.is_dashing = true
	$DashDuration.start()

func exit():
	player.is_dashing = false

func update(_delta):
	var _coll = player.move_and_slide(dash_dir * dash_speed * 5)

func _on_DashDuration_timeout():
	state_machine.transition_to("Running")
