extends Resource
class_name PlayerStats

export var init_shotgun_ammo := 15
export var init_ar_ammo := 50
export var init_health := 200
var sg_ammo := init_shotgun_ammo
var ar_ammo := init_ar_ammo
var health := init_health
var has_ar: bool
var level 


func reset():
	sg_ammo = init_shotgun_ammo
	ar_ammo = init_ar_ammo
	health = init_health

