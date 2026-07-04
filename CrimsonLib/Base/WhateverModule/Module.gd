extends "res://FoxLib2/Fox2Module.gd"

func setLogs():
	_setLog("skins", true)
	_setLog("characters", true)
	_setLog("scenes", true)
	_setLog("items", true)
	_setLog("events", true)
	_setLog("partSkins", true)
	#_setLog("", true)

func register():
	.register()
	
	# Needed for registry of your custom bodyparts and whatnot!
	# *DO NOT* remove!
	setPath("res://Modules/whatever")

	id = "TestModule"
	author = "crimsonvulpes"
	
