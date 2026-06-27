extends SexActivityBase

func _init():
	id = "SubUndressActions"
	startedByDom = false
	startedBySub = true
	
	activityName = "Undress"
	activityDesc = "Take off something."
	activityCategory = ["Undress"]

func getGoals():
	return {
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
		return 1.0 - _subInfo.getResistScore()
	return 0.0 + max(_subInfo.fetishScore({Fetish.Exhibitionism: 0.2}), 0.0) * _subInfo.getComplyScore()

const bodypartsToExpose:Array = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]

func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	var handledItems:Dictionary = {}
	
	if(sub.hasBoundArms() || sub.hasBlockedHands()):
		return
	
	var theActivityScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	for bodypartToExpose in bodypartsToExpose:
		var firstItem = sub.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem == null || handledItems.has(firstItem) || firstItem.isRestraint()):
			continue
		
		handledItems[firstItem] = true
		var thestate = firstItem.getItemState()
		var hack = firstItem.getVisibleName()
		var case = firstItem.getClothingSlot()
		if(hack.begins_with("Uniform Bottoms")):
			case = "underwearBottom"
		if(hack.begins_with("Uniform Shirt")):
			case = "underwearTop"
		match case:
			"body":
				if(!thestate.isShirtOpened()):
					addStartAction([firstItem, "shirt"], "Move shirt", "Shift your clothes", theActivityScore, {A_CATEGORY: ["Undress"]})
				if(!thestate.areShortsPulledDown()):
					addStartAction([firstItem, "shorts"], "Move shorts","Shift your clothes", theActivityScore, {A_CATEGORY: ["Undress"]})
			"underwearTop":
				if(!thestate.isBraPulledUp()):
					addStartAction([firstItem, "bra"], "Move bra", "Shift your clothes", theActivityScore, {A_CATEGORY: ["Undress"]})
			"underwearBottom":
				if(!thestate.arePantiesShiftedAside()):
					addStartAction([firstItem, "panties"], "Move panties", "Shift your clothes", theActivityScore, {A_CATEGORY: ["Undress"]})
		addStartAction([firstItem, false], "Take off "+str(firstItem.getCasualName()), "Take off a certain item from yourself", theActivityScore, {A_CATEGORY: ["Undress"]})

func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.HandsUsed]
	return []

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
	addText("{sub.You} {sub.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")
	fetishAffect(SUB_0, Fetish.Exhibitionism, 1.0)
