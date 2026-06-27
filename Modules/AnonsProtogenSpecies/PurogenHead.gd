extends BodypartHead

func _init():
	visibleName = "PuroGen head"
	id = "purogenhead"
	
	
func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/Purogen Head/PurogenHead.tscn"

func getHeadLength():
	return 0.6

func npcGenerationWeight(_dynamicCharacter):
	return 0.1
