extends BodypartTail

func _init():
	visibleName = "rabbit tail 1 custom"
	id = "rabbittail1custom"

func getCompatibleSpecies():
	return ["rabbit"]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["rabbit", "stubby"])

func getCharacterCreatorDesc():
	return "Rabbit tail with patterns affecting it"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitTail1 (custom)/RabbitTail1.tscn"
