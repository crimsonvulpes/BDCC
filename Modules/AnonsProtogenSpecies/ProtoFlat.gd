extends "res://Modules/AnonsProtogenSpecies/ProtoBreasts.gd"

func _init():
	visibleName = "alt flat breasts"
	id = "altmalebreasts"
	size = BreastsSize.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong"])

func getLewdName():
	if(size <= BreastsSize.A):
		return "pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

func safeWhenExposed():
	if(size <= BreastsSize.A):
		return true
	
	return false

func generateDataFor(_dynamicCharacter):
	pass
