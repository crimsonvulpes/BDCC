extends BodypartArms

func _init():
	visibleName = "Proto Buff Armored"
	id = "protobuffarms2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoBuffArms2/ProtoBuffArms2.tscn"
