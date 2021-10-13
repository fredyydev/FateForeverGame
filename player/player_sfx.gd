extends AudioStreamPlayer

export(Array, AudioStreamSample) var footsteps
export(AudioStreamMP3) var dash_sound

func play_footstep():
	#randomly selects a footstep sound effect and plays it.
	var footstep_index: int
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	footstep_index = rng.randi_range(0, 2)
	stream = footsteps[footstep_index]
	self.play()

func play_dash_sfx():
	stream = dash_sound
	self.play()
