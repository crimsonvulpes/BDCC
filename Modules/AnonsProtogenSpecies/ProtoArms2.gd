extends BodypartArms

func _init():
	visibleName = "proto arms 2"
	id = "protoarms2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoArms2/ProtoArms2.tscn"
