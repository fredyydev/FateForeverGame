extends Node

enum key_types {
	YELLOW,
	BLUE
}
var keys = [null, null]

func add_key(key):
	match key:
		key_types.YELLOW:
			keys[0] = key
		key_types.BLUE:
			keys[1] = key
		_:
			print("No valid key was given")

