extends BodypartLeg

func _init():
	visibleName = "Half Fluffy legs"
	id = "halfflufflegs"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/HalfFluffLegs/HalfFluffLegs.tscn"

func getTraits():
	return {
		PartTrait.LegsDigi: true,
	}

func getCharacterCreatorDesc():
	return "Extra fluff covers your legs, stopping at the knee"
