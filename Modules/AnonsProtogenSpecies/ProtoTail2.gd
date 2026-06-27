extends BodypartTail

func _init():
	visibleName = "Proto tail banded"
	id = "prototail2"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoTail2/ProtoTail2.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}

func getCharacterCreatorDesc():
	return "A protogen tail with metal bands embeded into it"
