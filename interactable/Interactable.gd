extends Area2D
class_name Interactable

#Custom class for interactables! 

signal on_player_interacted
signal on_player_exited
var player_in_area: bool

func _init():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "check_interaction")
# warning-ignore:return_value_discarded
	connect("body_exited", self, "player_exited")

func check_interaction(body: PhysicsBody2D):
	if body is Player:
		emit_signal("on_player_interacted", body)
		player_in_area = true

func player_exited(body: PhysicsBody2D):
	if body is Player:
		emit_signal("on_player_exited", body)
		player_in_area = false
