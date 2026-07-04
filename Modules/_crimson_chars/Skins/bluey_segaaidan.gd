extends SkinBase

func _init():
	id = "bluey_segaaidan_skin"
#	partID = "flufflegs"

func getName():
	return "bluey_segaaidan"

func getPatternTexture():
	return load("res://Modules/_crimson_chars/Skins/Textures/bluey_segaaidan.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
	}
