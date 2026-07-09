extends PartSkinBase

func _init():
	id = "pjfoxtail"
	partID = "puffywolftail"

func getName():
	return "PJFox Tail"

func getPatternTexture():
	return {
		"": preload("res://Modules/_crimson_chars/Skins/Textures/pjfox_tail.png"),
	}
