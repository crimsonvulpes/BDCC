extends BodypartLeg

func _init():
	visibleName = "protogen legs"
	id = "protolegs"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoLegs/ProtoLegs.tscn"

func getTraits():
	return {
		PartTrait.LegsDigi: true,
	}
