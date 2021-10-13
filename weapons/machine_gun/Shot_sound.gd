extends AudioStreamPlayer

func _init():
	play()

func _on_Destroy_timeout():
	queue_free()
