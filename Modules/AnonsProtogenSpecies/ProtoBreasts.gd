extends BodypartBreasts

func _init():
	visibleName = "breasts (alt)"
	id = "protobreasts"
	size = BreastsSize.C

func getCharacterCreatorDesc():
	return "Alt version of the regular breasts to make mis-match skins look better"

func getCompatibleSpecies():
	return ["protogen"]

func getBreastsScale():
	var thesize = getSize()
	return BreastsSize.breastSizeToBoneScale(thesize)

func getDoll3DScene():
	var thesize = getSize()
	if(thesize <= BreastsSize.FLAT):
		return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoFlat/ProtoBreastsFlat.tscn"
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/Protobreasts/ProtoBreastsScaleable.tscn"


func generateDataFor(_dynamicCharacter):
	size = RNG.pick([
		BreastsSize.A, BreastsSize.B, BreastsSize.C, BreastsSize.D, BreastsSize.DD, BreastsSize.DDD,
	])
