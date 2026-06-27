extends BodypartHead

func _init():
	visibleName = "Protogen head 2"
	id = "protogenhead2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtogenHead2/ProtogenHead2.tscn"

func getHeadLength():
	return 0.6
