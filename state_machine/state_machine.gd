extends Node
class_name StateMachine

export(NodePath) var init_state
onready var current_state := get_node(init_state) as State

signal transitioned_to

func _ready():
	yield(owner, "ready")
	current_state.enter()
	current_state.state_machine = self

func _process(delta):
	current_state.update(delta)

func _physics_process(delta):
	current_state.physics_update(delta)

func _unhandled_input(event):
	current_state.handle_input(event)

func transition_to(state: String, metadata := {}):
	current_state.exit()
	current_state = get_node(state)
	current_state.state_machine = self
	emit_signal("transitioned_to", state)
	current_state.enter(metadata)
	
