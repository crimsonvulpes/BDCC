extends BodypartTail

func _init():
	visibleName = "Feral Wolf Tail"
	id = "feralwolftail"

func getCompatibleSpecies():
	return [Species.Canine]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["feral", "fluffy", "rough"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/FeralWolfTail/FeralWolfTail.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
