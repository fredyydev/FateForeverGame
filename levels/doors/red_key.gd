extends Interactable



func _on_RedKey_on_player_interacted(body: Player):
	body.has_red_key = true
	$anim.play("pickup")
