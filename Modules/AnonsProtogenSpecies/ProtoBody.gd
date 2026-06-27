extends BodypartBody

func _init():
	visibleName = "protogen body"
	id = "protobody"

func getCompatibleSpecies():
	return ["protogen"]

func getDoll3DScene():
	return "res://Modules/AnonsProtogenSpecies/Bodyparts/ProtoBody/ProtoBody.tscn"
