extends SexActivityBase

func _init():
	id = "DomUndressActions"
	startedByDom = true
	startedBySub = false
	
	activityName = "Undress"
	activityDesc = "Take off something."
	activityCategory = ["Undress"]

func getGoals():
	return {
		SexGoal.SubUndressDom: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var baseMod:float = 0.01
	if(_sexEngine.hasTag(_domInfo.charID, SexActivityTag.PenisUsed) || _sexEngine.hasTag(_domInfo.charID, SexActivityTag.VaginaUsed) || _sexEngine.hasTag(_domInfo.charID, SexActivityTag.AnusUsed)):
		baseMod = 1.0
	
	return baseMod + max(_domInfo.fetishScore({Fetish.Exhibitionism: 0.1}), 0.0)

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var bodypartsToExpose:Array = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var dom:BaseCharacter = _domInfo.getChar()
	var handledItems:Dictionary = {}
	
	var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	
	for bodypartToExpose in bodypartsToExpose:
		var firstItem:ItemBase = dom.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		var thestate = firstItem.getItemState()
		var case = firstItem.getClothingSlot()
		var hack = firstItem.getVisibleName()
		if(hack.begins_with("Uniform Bottoms")):
			case = "underwearBottom"
		if(hack.begins_with("Uniform Shirt")):
			case = "underwearTop"
		match case:
			"body":
				if(!thestate.isShirtOpened()):
					addStartAction([firstItem, "shirt"], "Move shirt", "Shift your clothes", theScore)
				if(!thestate.areShortsPulledDown()):
					addStartAction([firstItem, "shorts"], "Move shorts","Shift your clothes", theScore)
			"underwearTop":
				if(!thestate.isBraPulledUp()):
					addStartAction([firstItem, "bra"], "Move bra", "Shift your clothes", theScore)
			"underwearBottom":
				if(!thestate.arePantiesShiftedAside()):
					addStartAction([firstItem, "panties"], "Move panties", "Shift your clothes", theScore)
		addStartAction([firstItem, false], "Take off "+str(firstItem.getCasualName()), "Take off a certain item from yourself", theScore)


func startActivity(_args):
	var theitem:ItemBase = _args[0]
	var _shift = _args[1]
	var itemState:ItemState = theitem.getItemState()
	if(itemState == null):
		getDom().getInventory().unequipItem(theitem)
	else:
		match _shift:
			"shirt":
				itemState.openShirt()
				theitem.updateWearerAppearance()
			"shorts":
				itemState.pullDownShorts()
				theitem.updateWearerAppearance()
			"bra":
				itemState.pullBraUp()
				theitem.updateWearerAppearance()
			"panties":
				itemState.shiftPantiesAside()
				theitem.updateWearerAppearance()
			_:
				itemState.remove()
	
	endActivity()
	addText("{dom.You} {dom.youVerb('take')} off {dom.yourHis} "+str(theitem.getCasualName())+".")
