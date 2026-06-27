extends BodypartEars

func _init():
	visibleName = "rabbit ears 1"
	id = "rabbitears1"

func getCompatibleSpecies():
	return ["rabbit"]

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitEar1/RabbitEars1.tscn"
