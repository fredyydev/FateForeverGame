extends Control

func _process(_delta):
	var current_weapon = PlayerGlobal.current_weapon
	for child in get_children():
		if child.name == current_weapon:
			if child.visible:
				return
			child.visible = true
		else:
			child.visible = false
