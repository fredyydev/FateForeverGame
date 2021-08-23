extends State

func enter(_md := {}):
	$TimeStaggered.start()


func _on_TimeStaggered_timeout():
	state_machine.transition_to("FollowPlayer")
