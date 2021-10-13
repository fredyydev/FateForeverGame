extends Interactable




func _on_BlueDoor_on_player_interacted(body: Player):
	if body.has_blue_key:
		$anim.play("pickup")
