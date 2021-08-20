extends State
class_name PlayerState

var player : Player

func _ready():
	yield(owner, "ready")
	player = owner as Player
