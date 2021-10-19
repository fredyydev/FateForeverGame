extends Interactable



func _on_one_killer_pick_on_player_interacted(player: Player):
	player.has_one_killer = true
	var file := File.new()
# warning-ignore:return_value_discarded
	file.open("user://weapon.had", File.WRITE)
	file.store_var(true)
	file.close()
	queue_free()
