extends BodypartHorns

func _init():
	visibleName = "protogen horns"
	id = "protohorns"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoHorns/ProtoHorns.tscn"

func npcGenerationWeight(_dynamicCharacter):
	return 0.1
