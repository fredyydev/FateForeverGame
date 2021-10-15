extends HSlider

var volume_save: float

func _ready():
	value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	volume_save = value
	
