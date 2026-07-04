extends SubGameWorld

func _on_Entrance_onEnter(room):
	room.addButton("Leave", "Leave", "leave")

func _on_onEnter(room):
	if room.roomID == "clib_settings":
		room.addButton("Settings", "Settings", "scene_change")
	elif room.roomID == "clib_sex":
		room.addButton("Sex", "Sex", "scene_change")
	elif room.roomID == "clib_player":
		room.addButton("Player", "Player", "scene_change")
	elif room.roomID == "clib_space":
		room.addButton("Vendomat", "Vendomat", "scene_change")
	elif room.roomID == "clib_space8":
		room.addButton("Extract", "Extract fluid from you", "scene_change")
	#if room.roomID == "clib_space2":
	#	room.addButton("Template", "Template", "scene_change")
		
func _on_onReact(room, key):
	if key == "scene_change":
		var scene = ""
		if room.roomID == "clib_settings":
			scene = "Crimson_CheatMenu_Settings"
		elif room.roomID == "clib_sex":
			scene = "Crimson_CheatMenu_Sex"
		elif room.roomID == "clib_player":
			scene = "Crimson_CheatMenu_Player"
		elif room.roomID == "clib_space":
			scene = "Crimson_CheatMenu_Vendomat"
		elif room.roomID == "clib_space8":
			scene = "Crimson_CheatMenu_Extract"
		else:
			scene = "Crimson_CheatMenu_Template"
		
		room.runScene(scene, [true])

#func _on_Entrance_onReact(_room, _key):

func _on_Entrance_onReact(_room, key):
	if ( key == "leave" ):
		GM.pc.setLocation("cellblock_nearcells")
		GM.main.reRun()

func _on_Entrance_onPreEnter(_room):
	print("[] _onPreEnter")
	#GM.main.getCurrentScene().removeCharacter("rahi")
