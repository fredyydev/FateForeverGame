extends PlayerState

func enter(_md := {}):
	player.anim.play("Idle")

func physics_update(_delta):
	if player.is_walking:
		state_machine.transition_to("Running")
