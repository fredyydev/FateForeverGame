extends PlayerState

export var walk_speed := 100.0
var can_dash := true

func enter(_md := {}):
	player.anim.play("Running")


func physics_update(_delta):
	if not player.is_walking:
		state_machine.transition_to("Idle")
	if Input.is_action_just_pressed("Dash") and can_dash:
		can_dash = false
		$DashCooldown.start()
		state_machine.transition_to("Dash", {"dir" : player.walk_direction()})
	
	player.walk(walk_speed * 5)


func _on_DashCooldown_timeout():
	can_dash = true 
