extends "res://Modules/FluffBodyPartsV3/FluffBreasts.gd"

func _init():
	visibleName = "fluffy flat chest"
	id = "fluffmalebreasts"
	size = BreastsSize.FOREVER_FLAT

func getLewdAdjective():
	return RNG.pick(["firm", "strong", "fluffy", "furry"])

func getLewdName():
	if(size <= BreastsSize.A):
		return "fluffy pecs"

	return RNG.pick(["manbreasts", "manboobs", "mantits", "jugs", "orbs"])

func safeWhenExposed():
	if(size <= BreastsSize.A):
		return true
	
	return false

func generateDataFor(_dynamicCharacter):
	pass
