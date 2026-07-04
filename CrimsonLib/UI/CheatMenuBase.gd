extends SceneBase

var from_floor = false

func getId(_ID) -> String:
	return "crimsonvulpes_CheatMenu_"+_ID

func _initScene(_args = []):
	if ( _args.size() > 0 ):
		from_floor = _args[0]
		
	pass
	
func _run():
	if from_floor:
		saynn("Mod: crimsonvulpes")
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
	
	
func saveData():
	var data = {}
	data["fromFloor"] = from_floor
	
	return data

func loadData(data):
	from_floor = SAVE.loadVar(data, "fromFloor", "")
	
