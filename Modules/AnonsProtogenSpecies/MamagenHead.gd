extends BodypartHead

func _init():
	visibleName = "Mamagen head"
	id = "mamagenhead"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/MamagenHead/MamagenHead.tscn"

func getHeadLength():
	return 0.55

func getCharacterCreatorDesc():
	return "based off the mamagen models from GhostlyShark"
