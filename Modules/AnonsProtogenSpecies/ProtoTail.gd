extends BodypartTail

func _init():
	visibleName = "Protogen tail"
	id = "prototail"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoTail/ProtoTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
