extends State

onready var soldier := owner as Soldier
export(NodePath) onready var wake_up_sound = get_node(wake_up_sound) as AudioStreamPlayer2D

func _ready():
# warning-ignore:return_value_discarded
	var error_message = PlayerGlobal.connect("player_spotted", self, "on_player_spotted")
	print(error_message)

func enter(_msg := {}):
	soldier.play_animation()

func on_player_spotted():
	if state_machine.current_state == self and soldier.global_position.distance_to(PlayerGlobal.player_position) < 600:
		wake_up_sound.play()
		state_machine.transition_to("FollowPlayer")
