extends State

func _ready():
# warning-ignore:return_value_discarded
	var error_message = PlayerGlobal.connect("player_spotted", self, "on_player_spotted")
	print(error_message)

func on_player_spotted():
	state_machine.transition_to("FollowPlayer")
