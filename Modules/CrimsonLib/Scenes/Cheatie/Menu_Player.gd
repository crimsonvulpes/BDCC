extends "res://CrimsonLib/Base/CheatMenu.gd"

var _item = ""

# saynn("Example of same-line checks. Player "+str("has a penis" if GM.pc.hasPenis() else "doesn't have a penis")+". Should say \"has a penis\" if you have one.")

const Globals = preload("res://FoxLib/Globals.gd")
var crimsonLib = null

func _init():
	sceneID = getId("Player")
	crimsonLib = Globals.ofModule("CrimsonLib")

func _run():
	._run()
	
	sayn("Player\n")

	if (state == ""):
		addButton("Inventory", "", "player_inventory")
		addButton("Fill Log", "See who has came inside you.. their cum has to still be in any hole tho.", "player_checkcame")
		addButton("Skills", "Test", "skills")
		
	if (state == "skills"):
		addButton("Back", "Back to main", "")

		for skill in GlobalRegistry.getSkills():
			addButton(skill, "Add", "skill_add", [skill])

	if (state == "player_checkcame"):
		var message = getContents_CheckCame()
		
		say(message)

		addButton("Back", "Back to main", "")

	if (state == "player_inventory"):
		saynn("Here, you can add items in the game to your inventory")
		
		addButton("Back", "Back to main", "")
		addButton("Give All", "That's alot. Give you ALL game items.", "inventory_add", ["all"])
		addButton("Items", "Seperated from this menu. Because its alot of shit.", "inventorysub")
		addButton("Item Contents", "Stuff like Penis Pump contents", "inventory_contents")

	if (state == "inventory_contents"):
		var _strapon = GM.pc.getWornStrapon()
		var _condom = GM.pc.getWornCondom()
		
		addButton("Back", "Back to main", "player_inventory")

		if _strapon:
			addButton(_strapon.id + " (equipped)", "Get its contents", "getContent", [_strapon])
		
		if _condom:
			addButton(_condom.id + " (equipped)", "Get its contents", "getContent", [_condom])
		
		say(getContents())

		for item in GM.pc.getInventory().items:
			if (item.id.to_lower() == "usedcondom"):
				addButton(item.id, "Get its contents", "getContent", [item])
			
		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.Strapon):
			addButton(item.id, "Get its contents", "getContent", [item])
		
		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump):
			addButton(item.id, "Get its contents", "getContent", [item])

		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.PenisPump):
			addButton(item.id, "Get its contents", "getContent", [item])

		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.PlasticBottle):
			addButton(item.id, "Get its contents", "getContent", [item])
			
			
	if (state == "inventorysub"):
		addButton("Back", "", "player_inventory")

		addButton("ID", "Add a item to your inventory by ID")
		for item in GlobalRegistry.getItemRefs():
			print(item)
		# 	addButton(item, "a item", "inventory_add", [item])

func _react(_action: String, _args):
	._react(_action, _args)
	
	if (_action == "skill_add"):
		#increaseStatIfCan
		GM.pc.getSkillsHolder().addSkillExperience(_args[0], 99999999999999)
		return

	if (_action == "getContent"):
		_item = _args[0].uniqueID
		return
	
	if (_action == "inventory_add"):
		if _args[0] == "all":
			for item in GlobalRegistry.getItemRefs():
				GM.pc.getInventory().addItem(GlobalRegistry.createItem(item))
		else:
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(_args[0]))

		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["from_floor"] = from_floor
	data["item"] = _item

	# addMessage("Current Sex Character: " + selectedCharacter)

	return data
	
func loadData(data):
	.loadData(data)
	
	from_floor = SAVE.loadVar(data, "from_floor", false)
	_item = SAVE.loadVar(data, "item", "")

## Misc
func getContents():
	var message:String = ("" + GM.pc.getInventory().getItemByUniqueID(_item).id + " fluid contents:\n")
		
	for fluid in GM.pc.getInventory().getItemByUniqueID(_item).fluids.contents:
		## FluidDNA ##
		# fluid.fluidDNA.causerID
		##############
			
		message += str(ceil(fluid.amount)) + " ml of " + fluid.fluidType + " from " + fluid.fluidDNA.charID + "\n"

	return message

func getContents_CheckCame():
	var _pcAnus = GM.pc.getBodypart(BodypartSlot.Anus)
	var _pcKitty = GM.pc.getBodypart(BodypartSlot.Vagina)
	var _pcHead = GM.pc.getBodypart(BodypartSlot.Head)
	
	var anusOrifice: Orifice = _pcAnus.getOrifice()
	var kittyOrifice: Orifice = null
	
	if _pcKitty != null:
		kittyOrifice = _pcKitty.getOrifice()
		
	var headOrifice: Orifice = _pcHead.getOrifice()
	var orificeData_Anus = anusOrifice.saveData()
	var orificeData_Kitty = kittyOrifice.saveData()
	var orificeData_Head = headOrifice.saveData()


	var message:String = ("Contents in your orifices (like anus, kitty and mouth)\n\n\n")

	# Anus
	if (orificeData_Anus["fluids"]["contents"].size() > 0):
		message += "These people have came in your anus:\n"
		for content in orificeData_Anus["fluids"]["contents"]:
			if content.fluidType == "CumLube":
				message += str(ceil(content["amount"])) + " ml of CumLube from a Strapon, user is unknown.\n\n"
			else:
				var _char = GM.main.getCharacter(content["fluidDNA"]["charID"])
				
				message += ""+_char.getName()+" with "+str(ceil(content["amount"]))+" ml of "+content["fluidType"]+"\n"
		message += "\n"
	else:
		message += "These people have came in your anus:\nNoone :c\n\n"
	
	if _pcKitty != null:
		# Kitty
		if (orificeData_Kitty["fluids"]["contents"].size() > 0):
			message += "These people have came in your kitty:\n"
			for content in orificeData_Kitty["fluids"]["contents"]:
				if content.fluidType == "CumLube":
					message += str(ceil(content["amount"])) + " ml of CumLube from a Strapon, user is unknown.\n\n"
				else:
					var _char = GM.main.getCharacter(content["fluidDNA"]["charID"])
					
					message += ""+_char.getName()+" with "+str(ceil(content["amount"]))+" ml of "+content["fluidType"]+"\n"
			message += "\n"
		else:
			message += "These people have came in your kitty:\nNoone :c\n\n"
	
	# Head
	if (orificeData_Head["fluids"]["contents"].size() > 0):
		message += "These people have came in your mouth:\n"
		for content in orificeData_Head["fluids"]["contents"]:
			if content.fluidType == "CumLube":
				message += str(ceil(content["amount"])) + " ml of CumLube from a Strapon, user is unknown.\n\n"
			else:
				var _char = GM.main.getCharacter(content["fluidDNA"]["charID"])
				
				message += ""+_char.getName()+" with "+str(ceil(content["amount"]))+" ml of "+content["fluidType"]+"\n"
		message += "\n"
	else:
		message += "These people have came in your mouth:\nNoone :c\n\n"
		
	return message
