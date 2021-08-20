extends Node
class_name State

var state_machine


#Virtual functions
#They will be called by the state machine in the current active state
func enter(_metadata := {}):
	pass

func exit():
	pass

func update(_delta):
	pass

func physics_update(_delta):
	pass

func handle_input(_event):
	pass

	
