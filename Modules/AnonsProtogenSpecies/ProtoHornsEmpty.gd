extends BodypartHorns

#for when you only want some individuals from a species
#to spawn with horns

func _init():
	visibleName = "dragon horns"
	id = "emptyhorns"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return null

func npcGenerationWeight(_dynamicCharacter):
	return 1.0

func isPlayable():
	return false
