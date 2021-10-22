extends Node

func _on_Options_pressed():
	$MainTitle.visible = false
	$OptionsMenu.visible = true


func _on_GoMainMenu_pressed():
	$MainTitle.visible = true
	$OptionsMenu.visible = false
