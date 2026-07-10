extends SkinBase

func _init():
	id = "MangoSkin"
	author = "crimsonvulpes"
#	partID = "flufflegs"

func getName():
	return "Mango"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/mango.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
