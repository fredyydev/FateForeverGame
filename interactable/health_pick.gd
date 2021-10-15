extends Interactable

export var health_amount := 20

func _on_HealthPick_on_player_interacted(body: Player):
	if body.health >= body.max_heath:
		return
	body.add_health(health_amount)
	$anim.play("pickup")
