extends Enemy
class_name Soldier

export(NodePath) onready var shotgun = get_node(shotgun) as Node2D

func attack():
	shotgun.shoot()
	
func take_damage (_damage):
	.take_damage(_damage)
	$StateMachine.transition_to("Stagger")
