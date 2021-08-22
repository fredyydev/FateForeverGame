extends Weapon

export(Resource) var player_stats = player_stats as PlayerStats

func _ready():
	starting_ammo = player_stats.init_shotgun_ammo

func shoot():
	.shoot()
