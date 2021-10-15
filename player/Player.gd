extends Entity
class_name Player

var is_walking : bool 
var is_dashing: bool
var has_blue_key: bool
var has_red_key: bool
var has_machine_gun: bool
var health: int setget set_health
export var max_heath = 150
var player_stats := load("res://player/player_stats.tres")
onready var weapon_rig = $WeaponRig
export(NodePath) onready var anim = get_node(anim) as AnimationPlayer

func _ready():
	player_stats.reset()
	health = player_stats.health
	print(health)

func _input(_event):
	if Input.is_action_just_pressed("pause"):
		match $CanvasLayer/MainMenu.visible:
			false:
				$CanvasLayer/MainMenu.visible = true
				Engine.time_scale = 0
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			true:
				Engine.time_scale = 1
				$CanvasLayer/MainMenu.visible = false
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func set_health(value):
	health = value
	PlayerGlobal.emit_signal("player_health_change", health)

func _physics_process(_delta):
	if health <= 0:
		die()
	elif health > max_heath:
		health = max_heath
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
	set_health(health - damage)
	player_stats.health = health
	print(health)

func add_ammo(amount: int, gun_name: String):
	var gun: Weapon = get_node("WeaponRig/" + gun_name)
	gun.current_ammo += amount
	print(gun.current_ammo)

func add_health(amount):
	set_health(health + amount)
	player_stats.health = health
	print(health)

func die():
# warning-ignore:return_value_discarded
	get_tree().quit()
