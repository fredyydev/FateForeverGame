extends State

onready var eevil := owner as Eeevil
export var speed := 65.0
onready var pl_pos = PlayerGlobal.player_position
var nav2D: Navigation2D
var nav_path: PoolVector2Array
var rng := RandomNumberGenerator.new()

func enter(_md := {}):
	rng.randomize()
	$AttackRandom.wait_time = rng.randf_range(1,2.8)
	$AttackRandom.start()
	if eevil.get_tree().has_group("Navigation"):
		nav2D = eevil.owner.get_node("Navigation2D")
	$UpdatePath.start()

func exit():
	$UpdatePath.stop()
	$AttackRandom.stop()

func _on_UpdatePath_timeout():
	if not owner.get_tree().has_group("Navigation"):
		return
	rng.randomize()
	nav_path = nav2D.get_simple_path(eevil.global_position, 
	pl_pos + Vector2.ONE * rng.randf_range(1, 400)) 

func move_to_path():
	#don't run if the current tree doesn't have a nav mesh
	if not owner.get_tree().has_group("Navigation"):
		return
	var _move_direction: Vector2
	#for _index in (nav_path.size()):
		#This entity will always move towards the first point in the path
		#Once we're close enough, we remove zero, so the next point becomes zero
		#And so we keep moving towards the player
	if nav_path.size() > 1:
		if eevil.global_position.distance_to(nav_path[0]) > 15:
			_move_direction = eevil.global_position.direction_to(nav_path[0])
		else:
			nav_path.remove(0)
	#Finally move the soldier
	if eevil.global_position.distance_to(pl_pos) > 300:
		var _coll = eevil.move_and_slide(_move_direction.normalized() * speed * 5, Vector2.ZERO, false, 15)

func physics_update(_delta):
	pl_pos = PlayerGlobal.player_position
	eevil.look_at(pl_pos)
	move_to_path()





func _on_AttackRandom_timeout():
	eevil.attack()
