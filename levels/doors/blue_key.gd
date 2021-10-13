extends Interactable


func _on_BlueKey_on_player_interacted(body: Player):
	body.has_blue_key = true
	$anim.play("pickup")
