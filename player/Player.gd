extends KinematicBody2D
class_name Player
var is_walking : bool
var is_dashing: bool

func _process(_delta):
	#Set global variable for player position
	PlayerGlobal.player_position = self.global_position
	#Check if the player is walking (by using input)
	is_walking = (Input.is_action_pressed("up") or
	Input.is_action_pressed("down") or
	Input.is_action_pressed("left") or
	Input.is_action_pressed("right") 
	)
	#Look at mouse position(unless if dashing)
	if not is_dashing:
		look_at(get_global_mouse_position())

func walk_direction() -> Vector2:
	var y = Input.get_action_strength("down") - Input.get_action_strength("up")
	var x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return Vector2(x, y)

func walk(speed: float):
	var walk_dir = walk_direction()

	var _coll = move_and_slide(walk_dir.normalized() * speed)
