extends BodypartBody

func _init():
	visibleName = "fluffy body"
	id = "fluffbody"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffBody/FluffBody.tscn"
