extends "res://Modules/ClothingRevamp/Uniforms/InmateUniformGeneral.gd"

func _init():
	id = "inmateuniformHighsec"
	inmateType = InmateType.HighSec

func getTags():
	return [
		ItemTag.HighSecurityInmateUniform,
		]
