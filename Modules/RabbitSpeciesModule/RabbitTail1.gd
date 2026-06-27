extends BodypartTail

func _init():
	visibleName = "rabbit tail 1"
	id = "rabbittail1"

func getCompatibleSpecies():
	return ["rabbit"]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["rabbit", "stubby"])

func getCharacterCreatorDesc():
	return "Rabbit tail with default pattern"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitTail1/RabbitTail1.tscn"
