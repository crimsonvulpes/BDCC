extends BodypartHead

func _init():
	visibleName = "ari wolf head"
	id = "ariwolfhead"

func getCompatibleSpecies():
	return [Species.Canine]

func getDoll3DScene():
	return "res://Modules/_crimson_chars/Bodyparts/Models/AriWolfHead/AriWolfHead.tscn"

func getHeadLength():
	return 0.5
