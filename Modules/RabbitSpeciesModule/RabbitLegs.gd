extends BodypartLeg

func _init():
	visibleName = "rabbit legs"
	id = "rabbitlegs"

func getCompatibleSpecies():
	return ["rabbit"]

func getDoll3DScene():
	return "res://Modules/RabbitSpeciesModule/Bodyparts/RabbitLegs/RabbitLegs.tscn"
