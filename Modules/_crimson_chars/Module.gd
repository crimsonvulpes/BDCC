extends "res://CrimsonLib/CrimsonModule.gd"

func setLogs():
	_setLog("characters", true)
	_setLog("bodyparts", true)
	
	#_setLog("", true)

func _init():
	id = "Crimson Characters"
	name = "Crimson Characters"
	author = "crimsonvulpes"
	
	# Needed for registry of your custom bodyparts and whatnot!
	# *DO NOT* remove!
	setPath("res://Modules/_crimson_chars")
	
func register():
	id = "Crimson Characters"
	name = "Crimson Characters"
	author = "crimsonvulpes"
	
	setLogs()
	.register()
	