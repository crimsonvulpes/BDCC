extends BodypartTail

func _init():
	visibleName = "Proto FluffTail"
	id = "Protofoxtail"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoFluffTail/AlteredFoxTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}

func getCharacterCreatorDesc():
	return "A large fluffy tail based on the fox tail"
