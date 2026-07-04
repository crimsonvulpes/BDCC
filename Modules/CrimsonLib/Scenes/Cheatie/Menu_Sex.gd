extends "res://CrimsonLib/Base/CheatMenu.gd"

var foxybusiness = preload("res://CrimsonLib/FoxyBusiness.gd").new()
var pickedPoolToShow = ""
var selectedCharacter = ""
var animArgs = {}

const Globals = preload("res://FoxLib/Globals.gd")
var crimsonLib = null

func _init():
	sceneID = getId("Sex")

	crimsonLib = Globals.ofModule("CrimsonLib")

func _run():
	._run()
	sayn("Sex\n")
	
	if (state == ""):
		saynn("Go to the characters menu (by the characters button) and select a character.\n\nNote: There is previews to see if you like the cutie")

		if selectedCharacter != "":
			addButton("Start", "Start sex. select normal, stocks, slutwall.", "sex_start")
		else:
			addDisabledButton("Start", "You cannot do this.")
		addButton("Characters", "Select characters. From module or dynamic npc..", "sex_characters")

	elif (state.begins_with("sex")):
		if (state == "sex_start"):
			addButton("Back", "Back", "")
			# hack fix cuz you can change the state in the save file.
			if selectedCharacter != "":
				
				addButton("Default - Dom", "Dom", "sex_start_real", ["pc", selectedCharacter, SexType.DefaultSex])
				addButton("Stocks - Dom", "Dom", "sex_start_real", ["pc", selectedCharacter, SexType.StocksSex])
				addButton("Slutwall - Dom", "Dom", "sex_start_real", ["pc", selectedCharacter, SexType.SlutwallSex])
				if ( OS.has_feature("editor") ):
					addButton("Bitchsuit - Dom", "Dom", "sex_start_real", ["pc", selectedCharacter, SexType.BitchsuitSex])
					addButton("Tentacles - Dom", "Dom", "sex_start_real", ["pc", selectedCharacter, SexType.TentaclesSex])

				addButton("Default - Sub", "Sub", "sex_start_real", [selectedCharacter, "pc", SexType.DefaultSex])
				addButton("Stocks - Sub", "Sub", "sex_start_real", [selectedCharacter, "pc", SexType.StocksSex])
				addButton("Slutwall - Sub", "Sub", "sex_start_real", [selectedCharacter, "pc", SexType.SlutwallSex])
				if ( OS.has_feature("editor") ):
					addButton("Bitchsuit - Sub", "Sub", "sex_start_real", [selectedCharacter, "pc", SexType.BitchsuitSex])
					addButton("Tentacles - Sub", "Sub", "sex_start_real", [selectedCharacter, "pc", SexType.TentaclesSex])
			else:
				setState("sex_characters")
		elif (state == "sex_characters"):
			saynn("You want a cutie from a module, or a cutie dynamic npc")

			addButton("Back", "Back", "")

			#GM.pc.getName()
			if crimsonLib.showLikedCharacters == true:
				addButton("Characters I Like", "Characters I like", "sex_characters_like")

			addButton("CrimsonLib Characters", "Characters that use CrimsonLibs Character base", "sex_characters_crimsonlib")
			addButton("Character from Module", "Modules", "sex_characters_modules")
			addButton("Dynamic NPC", "Dynamic NPC", "sex_characters_dynamicnpc")
	
		else:
			addButton("Back", "", "sex_characters")
				
			if (state == "sex_characters_crimsonlib"):
				for _character in GlobalRegistry.getCharacters():
					var character = GlobalRegistry.getCharacter(_character)
					var charIDLower = _character.to_lower()
					var charName = character.getName()
					var charNameN = charName.substr(0, charName.length() - 1)
					
					if ( charIDLower.begins_with("crimsonlib") || charIDLower.begins_with("clib") ):
						addButton(charName, "Select them", "sex_character", ["fully clothed", _character])
						
						if ( charName.ends_with(")") ):
							addButton(charNameN + ", nude)", "Select them", "sex_character", ["nude", _character])
						else:
							addButton(charName + " (nude)", "Select them", "sex_character", ["nude", _character])
						#addButton(character, character + ")\n\nSelect them", "sex_character", ["fully clothed", character])
						
						
			elif (state == "sex_characters_like"):
				var likedChars = foxybusiness.getLikedChars()
				
				for character in likedChars:
					var actChar = GlobalRegistry.getCharacter(character)
					var charName = actChar.getName()
					addButton(charName, "", "sex_character", ["fully clothed", character])
					addButton(charName + " - nude", "", "sex_character", ["nude", character])
			elif (state == "sex_characters_modules"):
				# addButton(, "Character", "sex_character_select")
				for character in GlobalRegistry.getCharacters():
					#if GlobalRegistry.getModule("Module").isActualCharacter(character):
					addButton(character, "", "sex_character", ["fully clothed", character])
					addButton(character, " - nude", "sex_character", ["nude", character])
			elif (state == "sex_characters_dynamicnpc"):
				var encounterPools = GM.main.getDynamicCharactersPools()
					
				for encounterPoolID in encounterPools:
					addButton(str(encounterPoolID), "Pick this occupation", "sex_characters_dynamicnpc_occupation", [encounterPoolID])
			elif (state == "sex_characters_dynamicnpc_occupation"):
				addButton("Back", "", "sex_characters_dynamicnpc")
				var characterIDS = GM.main.getDynamicCharacterIDsFromPool(pickedPoolToShow)
				for characterID in characterIDS:
					var dynamicCharacter: BaseCharacter = GlobalRegistry.getCharacter(characterID)
					if(dynamicCharacter == null):
						continue

					var NPCname = dynamicCharacter.getName()
					# var gender = NpcGender.getVisibleName(dynamicCharacter.npcGeneratedGender)
					# var subbyStat = dynamicCharacter.getPersonality().getStat(PersonalityStat.Subby)
					# var sharedKidsAmount = GM.CS.getSharedChildrenAmount("pc", characterID)

					addButton(NPCname, "", "sex_character", ["fully clothed", dynamicCharacter.getID()])
					addButton(NPCname + " - nude", "", "sex_character", ["nude", dynamicCharacter.getID()])
					# npclist.addRow(NPCname, gender, subbyStat, characterID, pickedPoolToShow, sharedKidsAmount, dynamicCharacter.canForgetCharacter(), dynamicCharacter.canMeetCharacter())

	if selectedCharacter != "":
		saynn("Selected Character: " + selectedCharacter)
		playAnimation(StageScene.Duo, "", animArgs)

	
func _react(_action: String, _args):
	._react(_action, _args)
	
	if(_action == "sex_characters_dynamicnpc_occupation"):
		pickedPoolToShow = _args[0]

	if (_action == "sex_character"):
		animArgs = {npc=_args[1]}
		if _args[0] == "nude":
			animArgs = {npc=_args[1], bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}}
		playAnimation(StageScene.Duo, "", animArgs)

		selectedCharacter = _args[1]
		addMessage("You've selected " + selectedCharacter + " as your sex character.")

		return

	if (_action == "sex_start_real"):
		# DefaultSex, Stocks, SlutwallSex
		runScene("GenericSexScene", [_args[0], _args[1], _args[2]], "after_sex")
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["from_floor"] = from_floor
	data["pickedPoolToShow"] = pickedPoolToShow
	data["selectedCharacter"] = selectedCharacter
	data["animArgs"] = animArgs

	# addMessage("Current Sex Character: " + selectedCharacter)

	return data
	
func loadData(data):
	.loadData(data)
	
	from_floor = SAVE.loadVar(data, "from_floor", false)
	pickedPoolToShow = SAVE.loadVar(data, "pickedPoolToShow", "")
	selectedCharacter = SAVE.loadVar(data, "selectedCharacter", "")
	animArgs = SAVE.loadVar(data, "animArgs", {})
