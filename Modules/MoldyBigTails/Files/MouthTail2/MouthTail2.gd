extends BodypartTail

func _init():
	visibleName = "Mouth Tail 2"
	id = "mouthtail2"

func getCompatibleSpecies():
	return [Species.Any]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["wiggling", "fluffy", "panting"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/MouthTail2/MouthTail2.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
