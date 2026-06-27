extends BodypartArms

func _init():
	visibleName = "Half Fluffy Arms"
	id = "fluffarmshalf"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/HalfFluffArms/HalfFluffArms.tscn"

func getCharacterCreaotrDesc():
	return "Arms with extra fluff, stopping at the elbow"
