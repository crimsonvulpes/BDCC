extends BodypartHead

func _init():
	visibleName = "rabbit head"
	id = "rabbithead"

func getCompatibleSpecies():
	return ["rabbit"]

func getCharacterCreatorDesc():
	return "Rabbit head with default pattern"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitHead/RabbitHead.tscn"
