extends BodypartEars

func _init():
	visibleName = "rabbit ears 2"
	id = "rabbitears2"

func getCompatibleSpecies():
	return ["rabbit"]

func getCharacterCreatorDesc():
	return "Rabbit ear with default pattern"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitEar2/RabbitEars2.tscn"
