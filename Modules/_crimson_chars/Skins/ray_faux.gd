extends SkinBase

func _init():
	id = "RayFauxSkin"
	author = "crimsonvulpes"
#	partID = "flufflegs"

func getName():
	return "FurFaux"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/RayFaux.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
