extends PartSkinBase

func _init():
	id = "fluffleopardpattern3"
	partID = "fluffleopardtail"

func getName():
	return "Fluffy Leopard Pattern 3"

func getPatternTexture():
	return {
		"": preload("res://Modules/MoldyBigTails/Images/FelineTails/FluffLeopardPattern3.png"),
	}
