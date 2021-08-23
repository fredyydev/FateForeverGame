extends State

onready var soldier := owner as Soldier

func enter(_md := {}):
	$wait_attack.start()

func exit():
	$wait_attack.stop()

func update(_delta):
	soldier.look_at(PlayerGlobal.player_position)

func _on_wait_attack_timeout():
	soldier.attack()
	state_machine.transition_to("FollowPlayer")
