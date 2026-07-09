extends SceneBase

func getId(_ID) -> String:
	return "Crimson_CheatMenu_"+_ID

func _initScene(_args = []):
	pass
	
func _run():
	#if from_floor:
	saynn("Scene: Menu_Main")
		
	if (state == ""):
		saynn("State: None")
	else:
		saynn("State: " + state)
			
	if ( state == "" ):
		addButton("Back", "Back to the game", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
		return
