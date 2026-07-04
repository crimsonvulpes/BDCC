extends "res://CrimsonLib/Base/CheatMenu.gd"

func _init():
	sceneID = getId("Main")

func _run():
	._run()
	if (state == ""):
		addButton("Settings", "Settings", "changeScene", ["Crimson_CheatMenu_Settings"])
		addButton("Sex", "Sub and dom sex", "changeScene", ["Crimson_CheatMenu_Sex"])
		addButton("Player", "Stuff for player", "changeScene", ["Crimson_CheatMenu_Player"])

		if ( OS.has_feature("editor") or (OS.has_feature("debug")) ):
			addButton("Testing", "Testing Shit", "changeScene", ["Crimson_Scenes_Testing"])
	
func _react(_action: String, _args):
	._react(_action, _args)
	
	if _action == "test":
		addMessage("Test")
		return
	if (_action == "addPawn"):
		var pawn = _args[0]
		GM.main.IS.spawnPawnIfNeeded(pawn)
		return
	
	setState(_action)

# func getDebugActions():
# 	return [
# 		{
# 			"id": "test",
# 			"name": "test",
# 			"args": []
# 		}
# 	]

# func doDebugAction(id, args = {}):
# 	print("[Debug] '" + id, "' args: ", args)
	
