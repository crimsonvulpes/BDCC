extends BodypartHead

func _init():
	visibleName = "Protogen head"
	id = "protogenhead"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtogenHead/ProtogenHead.tscn"

func getHeadLength():
	return 0.6
