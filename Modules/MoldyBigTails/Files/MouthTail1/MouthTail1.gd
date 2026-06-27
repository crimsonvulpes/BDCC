extends BodypartTail

func _init():
	visibleName = "Mouth Tail 1"
	id = "mouthtail1"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["wiggling", "fluffy", "panting"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/MouthTail1/MouthTail1.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
