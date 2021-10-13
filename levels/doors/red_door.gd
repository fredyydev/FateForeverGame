extends Interactable

func _on_RedDoor_on_player_interacted(body: Player):
	if body.has_red_key:
		$anim.play("pickup")

