extends SkinBase

func _init():
	id = "LayeredSkin"

func getName():
	return "Lasagna"

func getPatternTexture():
	return preload("res://Modules/0LayeredSkin/theSkin/LayeredSkin_f_s_m.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
		SkinType.SkinAndFur: 1.0
	}