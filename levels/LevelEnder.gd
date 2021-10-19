extends Interactable

export(PackedScene) var next_scene: PackedScene

func _on_LevelEnder_on_player_interacted(_player):
# warning-ignore:return_value_discarded
	get_tree().change_scene(next_scene.get_path())
