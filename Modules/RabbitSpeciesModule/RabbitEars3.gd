extends BodypartEars

func _init():
	visibleName = "rabbit ears 3"
	id = "rabbitears3"

func getCompatibleSpecies():
	return ["rabbit"]

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitEar3/RabbitEars3.tscn"
