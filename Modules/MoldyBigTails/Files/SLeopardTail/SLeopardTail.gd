extends BodypartTail

func _init():
	visibleName = "Snow Leopard Tail"
	id = "sleopardtail"

func getCompatibleSpecies():
	return [Species.Feline]

func getLewdSizeAdjective():
	return RNG.pick(["long"])

func getLewdAdjective():
	return RNG.pick(["soft", "fluffy", "warm"])

func getDoll3DScene():
	return "res://Modules/MoldyBigTails/Files/SLeopardTail/SLeopardTail.tscn"

func hasCustomSkinPattern():
	return true

func getTraits():
	return {
		PartTrait.TailFlexible: true,
	}
