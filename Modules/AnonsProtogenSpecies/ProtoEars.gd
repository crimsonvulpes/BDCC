extends BodypartEars

func _init():
	visibleName = "Proto ears"
	id = "ProtoEars"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoEars/ProtoEars.tscn"
