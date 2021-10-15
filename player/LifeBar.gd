extends TextureProgress

onready var player_stats := load("res://player/player_stats.tres")

func _ready():
	value = player_stats.health
# warning-ignore:return_value_discarded
	PlayerGlobal.connect("player_health_change", self, "change_health")

func change_health(new_value):
	value = new_value
