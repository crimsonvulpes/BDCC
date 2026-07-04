extends "res://CrimsonLib/Base/CheatMenu.gd"

func _init():
	print("meow")
	sceneID = getId("Settings")

func _run():
	._run()
	
func _react(_action: String, _args):
	._react(_action, _args)
	
