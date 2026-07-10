extends SkinBase

func _init():
	id = "AmtoSkin"
	author = "crimsonvulpes"
#	partID = "flufflegs"

func getName():
	return "Amto"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/amto.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
