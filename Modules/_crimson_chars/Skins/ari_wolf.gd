extends SkinBase

func _init():
	id = "AriWolfSkin"
	author = "crimsonvulpes"
#	partID = "flufflegs"

func getName():
	return "AriWolf"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/AriWolf.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
