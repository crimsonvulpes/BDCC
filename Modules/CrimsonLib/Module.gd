extends "res://CrimsonLib/CrimsonModule.gd"

var cheatie
var showLikedCharacters

func setLogs():
	_setLog("species", true)
	_setLog("characters", true)
	_setLog("events", true)
	
	#_setLog("", true)

func _init():
	id = "CrimsonLib"
	name = "CrimsonLib"
	author = "crimsonvulpes"
	
	# Needed for registry of your custom bodyparts and whatnot!
	# *DO NOT* remove!
	setPath("res://Modules/CrimsonLib")
	
func register():
	id = "CrimsonLib"
	name = "CrimsonLib"
	author = "crimsonvulpes"
	
	setLogs()
	.register()
	
	
	# FoxLib settings
	self.addBooleanOption("cheatie", "Enable Cheat Menu", "A button to access a floor for sex and other.. access this from your cell.")
	self.addBooleanOption("showLikedCharacters", "Show Liked Characters in Sex Menu", "Name says it all.")

	# Floors
	GlobalRegistry.registerMapFloor("crimsonlib_cheat_floor", path+"/Floors/Test.tscn")
	
	var a = FoxyBusiness.new()
	a.makeCrimsonCfg()
