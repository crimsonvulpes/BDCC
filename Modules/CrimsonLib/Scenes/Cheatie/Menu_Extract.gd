extends "res://CrimsonLib/Base/CheatMenu.gd"

var part = "none"
var isGood = false

func _init():
	sceneID = getId("Extract")

func _run():
	._run()
	if (state == ""):
		# sayn("Meow from Menu_Template")
		addButton("Test", "Test", "selectPart", ["kitty"])
		
		if isGood:
			print("[] valid")
		# addButton("ChangeScene", "Scene", "changeScene", ["Crimson_Menu_Settings"])
	
func _react(_action: String, _args):
	._react(_action, _args)
	
	if ( _action == "selectPart" ):
		part = _args[0]
		isGood = true
		return
		
	
	setState(_action)
