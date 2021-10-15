extends Label

var player_stats = load("res://player/player_stats.tres")

func _ready():
	text = str(player_stats.ar_ammo)
# warning-ignore:return_value_discarded
	PlayerGlobal.connect("ammo_changed", self, "change_ammo_vl")

func change_ammo_vl(weapon_name, value):
	if weapon_name == "MachineGun":
		text = str(value)
