extends PlayerState

func update(_delta):
	if player.is_walking:
		state_machine.transition_to("Running")
