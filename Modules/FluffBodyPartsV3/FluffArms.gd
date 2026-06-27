extends BodypartArms

func _init():
	visibleName = "Fluffy arms"
	id = "fluffarms"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffArms/FluffArms.tscn"
