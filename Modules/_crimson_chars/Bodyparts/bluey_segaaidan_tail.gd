extends BodypartTail

func _init():
	visibleName = "bluey_segaaidan_tail"
	id = "bluey_segaaidan_tail"

func getCompatibleSpecies():
	return ["fox", "arctic_fox"]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/bluey_segaaidan_tail.tscn"
