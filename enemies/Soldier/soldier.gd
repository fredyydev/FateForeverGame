extends Enemy
class_name Soldier

export(NodePath) onready var shotgun = get_node(shotgun) as Node2D
export(NodePath) onready var animPlay = get_node(animPlay) as AnimationPlayer

func attack():
	shotgun.shoot()

func take_damage (_damage):
	.take_damage(_damage)

func play_animation(animation_name := "Idle"):
	animPlay.play(animation_name)

func _on_DetectionArea_body_entered(body):
	if body is Player:
		PlayerGlobal.emit_signal("player_spotted")
