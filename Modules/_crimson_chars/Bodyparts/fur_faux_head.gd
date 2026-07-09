extends BodypartHead

func _init():
	visibleName = "fur_faux_head"
	id = "furfauxfoxhead"

func getCompatibleSpecies():
	return ["fox", "arctic_fox"]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/FurFauxHead/FurFauxFoxHead.tscn"

func getHeadLength():
	return 0.5
