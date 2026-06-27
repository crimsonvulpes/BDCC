extends BodypartTail

func _init():
	visibleName = "Proto Shark Tail"
	id = "sharktailproto"

func getCompatibleSpecies():
	return ["protogen"]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["scaly", "finned"])

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoSharkTail/ProtoSharkTail.tscn"

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}

func getCharacterCreatorDesc():
	return "the size of this one makes some skins look off -Anon"
