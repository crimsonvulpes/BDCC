extends BodypartTail

func _init():
	visibleName = "Puffy Wolf Tail"
	id = "puffywolftail"

func getCompatibleSpecies():
	return [Species.Canine]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["puffy", "fluffy", "silky"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/PuffyWolfTail/PuffyWolfTail.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
