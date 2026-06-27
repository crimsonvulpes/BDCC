extends BodypartEars

func _init():
	visibleName = "rabbit ears 2 custom"
	id = "rabbitears2custom"

func getCompatibleSpecies():
	return ["rabbit"]

func getCharacterCreatorDesc():
	return "Rabbit ear with patterns affecting it"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitEar2 (custom)/RabbitEars2.tscn"
