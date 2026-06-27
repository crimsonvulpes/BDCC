extends BodypartTail

func _init():
	visibleName = "proto short"
	id = "protoshorttail"

func getCompatibleSpecies():
	return ["protogen"]

func getLewdSizeAdjective():
	return RNG.pick(["short"])

func getLewdAdjective():
	return RNG.pick(["cybernetic"])

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoShortTail/ProtoShortTail.tscn"
