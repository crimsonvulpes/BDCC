extends BodypartHorns

func _init():
	visibleName = "Protogen horns 2"
	id = "protohorns2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoHorns2/ProtoHorns2.tscn"

func npcGenerationWeight(_dynamicCharacter):
	return 0.3
