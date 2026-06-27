extends BodypartTail

func _init():
	visibleName = "Fluffy Leopard Tail"
	id = "fluffleopardtail"

func getCompatibleSpecies():
	return [Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["soft", "fluffy", "sleek"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/FluffLeopardTail/FluffLeopardTail.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
