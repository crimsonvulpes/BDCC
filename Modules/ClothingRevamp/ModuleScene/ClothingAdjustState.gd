extends "res://Scenes/SceneBase.gd"



var savedActionText = ""
var uniqueItemID = ""


func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]
	else:
		sayn("An error happened. No clothing item was found.")
		return
		

func _reactInit():
	if(uniqueItemID == null || uniqueItemID == ""):
		return

		
func _init():
	sceneID = "ClothingAdjustState"

func _run():
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	var hack = item.getVisibleName()
	if(item.isRemoved()):
		return
	addButtonAt(14, "Cancel", "", "endthescene")
		

	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	if(item == null):
		return
	var state = item.getItemState()
	var slot = item.getClothingSlot()
	if(hack.begins_with("Uniform Bottoms")):
		slot = InventorySlot.UnderwearBottom
	if(hack.begins_with("Uniform Shirt")):
		slot = InventorySlot.UnderwearTop
	if(slot == InventorySlot.Body):
		if(!state.isShirtOpened() && !state.isDamaged()):
			addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "UniformExposeChest")

		if(!state.areShortsPulledDown() && !state.isDamaged()):
			if(item.getWearer().hasBlockedHands()):
				addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "UniformShakeShortsOff")
			else:
				addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "UniformExposeCrotch")
		
		if((state.isShirtOpened() && state.areShortsPulledDown()) && !state.isDamaged()):
			addButton("Fix clothes", "Cover up your body","clothingReset")
			
	if(slot==InventorySlot.UnderwearTop):
		if(!GM.pc.isInventorySlotBlocked(InventorySlot.UnderwearTop) || hack.begins_with("Uniform Shirt")):
			if(!state.isBraPulledUp()):
				if(item.getWearer().hasBlockedHands()):
					addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "BraShakeOff")
				else:
					addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "BraPullUp")
			else:
				addButton("Fix clothes", "Cover up your body","clothingReset")
			
	if(slot==InventorySlot.UnderwearBottom):
		if(!GM.pc.isInventorySlotBlocked(InventorySlot.UnderwearBottom) || hack.begins_with("Uniform Bottoms")):
			if(!state.arePantiesShiftedAside() && !state.isRemoved()):
				if(item.getWearer().hasBlockedHands()):
					addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "PantiesShakeOff")
				else:
					addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted(), "PantiesMoveAside")

			else:
				addButton("Fix clothes", "Cover up your body","clothingReset")
	for activity in lustCombatState.getAllText():
		sayn(activity)
		

func addLustActionsButtons(lustState, theActions, name):
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	for actionData in theActions:
#		var _test = actionData.id
		var lustAction = GlobalRegistry.getLustAction(actionData.id)
		if(actionData.id == name):
			var canDo = lustAction.canDo(lustState, actionData)
			var reasonWhyCant = "You can’t do this right now"
			if(canDo is Array):
				if(canDo.size() > 1):
					reasonWhyCant = canDo[1]
				canDo = canDo[0]
			
			if(canDo):
				addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doLustAction", [actionData])
			else:
				addDisabledButton(lustAction.getVisibleName(lustCombatState, actionData), reasonWhyCant)
			return

func _react(_action: String, _args):
	var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
	var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
	if(_action == "endthescene"):
		endScene()
		
	if(_action == "doLustAction"):
		processTime(10)
		
		var actionData = _args[0]
		print (actionData)
		
		var result = lustCombatState.doAction(actionData)
		savedActionText = result["text"]
		sayn(savedActionText)
		addButton("Continue","","endthescene")
		endScene()

		return
	
	if(_action == "clothingReset"):		
		item.getItemState().resetState()
		item.updateWearerAppearance()
		sayn("You fix your clothing.")
		endScene()
		return
		
	setState(_action)

