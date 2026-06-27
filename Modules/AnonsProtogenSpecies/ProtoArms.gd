extends BodypartArms

func _init():
	visibleName = "protogen arms"
	id = "protoarms"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoArms/ProtoArms.tscn"
