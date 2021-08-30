extends Entity
class_name Player

var is_walking : bool
var is_dashing: bool
var health: int
var player_stats := load("res://player/player_stats.tres")
export(NodePath) onready var anim = get_node(anim) as AnimationPlayer

func _ready():
	health = player_stats.health
	print(health)

func _physics_process(_delta):
	if health <= 0:
		die()
	#Set global variable for player position
	PlayerGlobal.player_position = self.global_position
	#Check if the player is walking 
	var walk_dir = walk_direction()
	is_walking = (walk_dir != Vector2.ZERO)
	
	#Look at mouse position(except when dashing)
	if not is_dashing:
		look_at(get_global_mouse_position())

func walk_direction() -> Vector2:
	var y = Input.get_action_strength("down") - Input.get_action_strength("up")
	var x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return Vector2(x, y)

func walk(speed: float):
	var walk_dir = walk_direction()

	var _coll = move_and_slide(walk_dir.normalized() * speed)

func take_damage(damage):
	health -= damage
	player_stats.health = health
	print(health)

func add_ammo(amount: int, gun_name: String):
	var gun: Weapon = get_node(gun_name)
	gun.current_ammo += amount
	print(gun.current_ammo)

func add_health(amount):
	health += amount
	player_stats.health = health
	print(health)

func die():
	get_tree().quit()
