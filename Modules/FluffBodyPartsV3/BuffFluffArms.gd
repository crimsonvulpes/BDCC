extends BodypartArms

func _init():
	visibleName = "Buff fluff arms"
	id = "bufffluffarms"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/BuffFluffArms/BuffFluffArms.tscn"
