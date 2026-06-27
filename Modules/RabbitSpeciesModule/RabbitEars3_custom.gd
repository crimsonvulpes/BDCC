extends BodypartEars

func _init():
	visibleName = "rabbit ears 3 custom"
	id = "rabbitears3custom"

func getCompatibleSpecies():
	return ["rabbit"]

func getCharacterCreatorDesc():
	return "Rabbit ear with patterns affecting it"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitEar3 (custom)/RabbitEars3.tscn"
