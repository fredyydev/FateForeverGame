extends PlayerState

export var walk_speed := 100.0


func update(_delta):
	if not player.is_walking:
		state_machine.transition_to("Idle")
	if Input.is_action_just_pressed("Dash"):
		state_machine.transition_to("Dash", {"dir" : player.walk_direction()})
	player.walk(walk_speed * 5)
