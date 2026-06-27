extends BodypartEars

func _init():
	visibleName = "Proto dual ears"
	id = "ProtoDualEars"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoDualEars/ProtoDualEars.tscn"
