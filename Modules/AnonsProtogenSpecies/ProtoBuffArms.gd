extends BodypartArms

func _init():
	visibleName = "Proto Buff"
	id = "protobuffarms"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoBuffArms/ProtoBuffArms.tscn"
