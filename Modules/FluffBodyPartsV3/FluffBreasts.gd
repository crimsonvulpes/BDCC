extends BodypartBreasts

func _init():
	visibleName = "fluffy breasts"
	id = "fluffbreasts"
	size = BreastsSize.C


func getCompatibleSpecies():
	return [Species.Any]

func getBreastsScale():
	var thesize = getSize()
	return BreastsSize.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffFlat/FluffBreastsFlat.tscn"
	return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffBreasts/FluffBreasts.tscn"


func generateDataFor(_dynamicCharacter):
	size = RNG.pick([
		BreastsSize.A, BreastsSize.B, BreastsSize.C, BreastsSize.D, BreastsSize.DD, BreastsSize.DDD,
	])
