extends Interactable


func _on_mg_pickup_on_player_interacted(player: Player):
	player.has_machine_gun = true
	$anim.play("pickup")
	player.weapon_rig.switch_weapon("MachineGun")
