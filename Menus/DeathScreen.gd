extends Control


func _ready():
	$AnimationPlayer.play("death_scene")

func _on_MainMenu_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/MainMenu.tscn")
