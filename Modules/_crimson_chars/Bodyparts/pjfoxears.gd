extends BodypartEars

func _init():
	visibleName = "pjfox ears"
	id = "pjfoxears"

func getCompatibleSpecies():
	return [Species.Canine, "arctic_fox", "fox"]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/pjfox/ears.tscn"
