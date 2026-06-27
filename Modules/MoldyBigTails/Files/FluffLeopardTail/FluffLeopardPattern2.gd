extends PartSkinBase

func _init():
	id = "fluffleopardpattern2"
	partID = "fluffleopardtail"

func getName():
	return "Fluffy Leopard Pattern 2"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/FelineTails/FluffLeopardPattern2.png"),
	}
