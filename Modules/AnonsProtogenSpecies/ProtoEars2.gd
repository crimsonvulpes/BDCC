extends BodypartEars

func _init():
	visibleName = "Proto ears 2"
	id = "ProtoEars2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoEars2/ProtoEars2.tscn"
