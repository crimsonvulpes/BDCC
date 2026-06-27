extends Module

func _init():
	id = "AnonsProtogenSpecies"
	author = "Original: Anon, Skins: Avery Winters"
	
	GlobalRegistry.registerSkin("res://Modules/AnonsProtogenSpecies/Skins/ProtogenSkin.gd")
	
	bodyparts = [
		"res://Modules/AnonsProtogenSpecies/ProtoEars.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoEars2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoTriEars.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoDualEars.gd",
		"res://Modules/AnonsProtogenSpecies/PurogenHead.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoTail.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoTail2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoShortTail.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoFoxTail.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoSharkTail.gd",
		"res://Modules/AnonsProtogenSpecies/ProtogenHead.gd",
		"res://Modules/AnonsProtogenSpecies/ProtogenHead2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoArms.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoArms2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoBuffArms.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoBuffArms2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoLegs.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoLegs2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoBody.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoBody2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoBody3.gd",
		"res://Modules/AnonsProtogenSpecies/MamagenHead.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoHorns.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoHorns2.gd",
		"res://Modules/AnonsProtogenSpecies/ProtoHornsEmpty.gd",
		#"res://Modules/AnonsProtogenSpecies/ProtoBreasts.gd",
		#"res://Modules/AnonsProtogenSpecies/ProtoFlat.gd",
	]

	species = [
		"res://Modules/AnonsProtogenSpecies/Protogen.gd"
	]
