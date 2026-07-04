extends "res://CrimsonLib/Base/CheatMenu.gd"

func _init():
	sceneID = getId("Template")

func _run():
	._run()
	if (state == ""):
		sayn("Meow from Menu_Template")

		addButton("Test", "Test", "test")
		# addButton("ChangeScene", "Scene", "changeScene", ["Crimson_Menu_Settings"])
	
func _react(_action: String, _args):
	._react(_action, _args)
	
	if _action == "test":
		addMessage("Test")
		return
		
	setState(_action)
