extends PartSkinBase

func _init():
	id = "sleopardpattern2"
	partID = "sleopardtail"

func getName():
	return "Snow Leopard Pattern 2"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/FelineTails/SLeopardPattern2.png"),
	}
