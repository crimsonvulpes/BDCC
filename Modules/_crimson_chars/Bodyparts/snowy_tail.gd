extends BodypartTail

func _init():
	visibleName = "snowy_tail"
	id = "snowy_tail"

func getCompatibleSpecies():
	return ["fox", "arctic_fox"]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/snowy_tail.tscn"
