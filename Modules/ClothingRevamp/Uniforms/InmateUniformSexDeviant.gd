extends "res://Modules/ClothingRevamp/Uniforms/InmateUniformGeneral.gd"

func _init():
	id = "inmateuniformSexDeviant"
	inmateType = InmateType.SexDeviant

func getTags():
	return [
		ItemTag.SexualDeviantInmateUniform,
		]
