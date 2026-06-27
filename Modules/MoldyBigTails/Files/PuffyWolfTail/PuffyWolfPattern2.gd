extends PartSkinBase

func _init():
	id = "puffytailpattern2"
	partID = "puffywolftail"

func getName():
	return "Puffy Tail Pattern 2"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/CanineTails/PuffyWolfPattern2.png"),
	}
