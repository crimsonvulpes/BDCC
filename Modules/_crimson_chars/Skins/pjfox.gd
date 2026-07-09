extends SkinBase

func _init():
	id = "pjfox"
	author = "crimsonvulpes"
#	partID = "flufflegs"

func getName():
	return "PJFox"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/pjfox.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
