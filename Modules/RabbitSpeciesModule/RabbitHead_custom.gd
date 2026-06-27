extends BodypartHead

func _init():
	visibleName = "rabbit head custom"
	id = "rabbitheadcustom"

func getCompatibleSpecies():
	return ["rabbit"]

func getCharacterCreatorDesc():
	return "Rabbit head with patterns affecting it"

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitHead (custom)/RabbitHead.tscn"
