extends BodypartEars

func _init():
	visibleName = "Proto Tri Ears"
	id = "prototriears"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoTriEars/ProtoTriEars.tscn"

func getCharacterCreatorDesc():
	return "you think making an illegal protogen is bad enough to go to space prison?"
