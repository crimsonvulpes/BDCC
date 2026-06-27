extends BodypartLeg

func _init():
	visibleName = "Fluffy legs"
	id = "flufflegs"

func getCompatibleSpecies():
	return [Species.Any]

func getDoll3DScene():
	return "res://Modules/FluffBodyPartsV3/Bodyparts/FluffLegs/FluffLegs.tscn"

func getTraits():
	return {
		PartTrait.LegsDigi: true,
	}
