extends PartSkinBase

func _init():
	id = "sleopardpattern3"
	partID = "sleopardtail"

func getName():
	return "Snow Leopard Pattern 3"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/FelineTails/SLeopardPattern3.png"),
	}
