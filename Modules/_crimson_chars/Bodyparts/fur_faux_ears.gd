extends BodypartEars

func _init():
	visibleName = "fur faux ears"
	id = "furfauxears"

func getCompatibleSpecies():
	return [Species.Canine, "arctic_fox", "fox"]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/FurFauxEars/furfauxears.tscn"
