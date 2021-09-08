extends State

onready var eevil := owner as Eevil

func _ready():
# warning-ignore:return_value_discarded
	var error_message = PlayerGlobal.connect("player_spotted", self, "on_player_spotted")
	print(error_message)

func on_player_spotted():
	if state_machine.current_state == self and eevil.global_position.distance_to(PlayerGlobal.player_position) < 1000:
		state_machine.transition_to("FollowPlayer")
