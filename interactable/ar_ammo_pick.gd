extends Interactable

export var ammo_amount := 5

func _on_ArAmmoPick_on_player_interacted(body: Player):
	body.add_ammo(ammo_amount, "MachineGun")
	$anim.play("pickup")
