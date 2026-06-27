extends PartSkinBase

func _init():
	id = "feraltailpattern2"
	partID = "feralwolftail"

func getName():
	return "Feral Tail Pattern 2"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/CanineTails/FeralWolfPattern2.png"),
	}
