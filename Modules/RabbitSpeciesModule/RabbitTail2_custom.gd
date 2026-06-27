extends BodypartTail

func _init():
	visibleName = "rabbit tail 2 custom"
	id = "rabbittail2custom"

func getCompatibleSpecies():
	return ["rabbit"]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["rabbit", "fluffy"])

func getCharacterCreatorDesc():
	return "Rabbit tail with patterns affecting it"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitTail2 (custom)/RabbitTail2.tscn"
