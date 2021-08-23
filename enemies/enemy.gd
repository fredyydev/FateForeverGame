extends Entity
class_name Enemy

export var initial_health := 100.0
onready var current_health = initial_health

#signal to use in other scripts
signal died

func _ready():
# warning-ignore:return_value_discarded
	connect("died", self, "die")

func take_damage(damage: float):
	current_health -= damage
	if current_health <= 0:
		emit_signal("died")

#virtual
func attack():
	pass

func die():
	queue_free()

