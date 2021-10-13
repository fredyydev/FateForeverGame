extends Resource
class_name PlayerStats

export var init_shotgun_ammo := 15
export var init_ar_ammo := 50
export var init_health := 200
onready var sg_ammo := init_shotgun_ammo
onready var ar_ammo := init_ar_ammo
onready var health := init_health


func reset():
	sg_ammo = init_shotgun_ammo
	ar_ammo = init_ar_ammo
	health = init_health

