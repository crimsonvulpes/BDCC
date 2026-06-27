extends BodypartTail

func _init():
	visibleName = "rabbit tail 2"
	id = "rabbittail2"

func getCompatibleSpecies():
	return ["rabbit"]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["rabbit", "fluffy"])

func getCharacterCreatorDesc():
	return "Rabbit tail with default pattern"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitTail2/RabbitTail2.tscn"
