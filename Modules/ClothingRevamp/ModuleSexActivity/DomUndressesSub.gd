extends SexActivityBase

#var itemToUndress:ItemBase	
var itemIDToRemove:String = ""
var tick:int = 0
var isShift:bool = false

func _init():
	id = "DomUndressesSub"
	startedByDom = true
	startedBySub = false
	
	activityName = "Undress sub"
	activityDesc = "Take off their clothes!"
	activityCategory = ["Undress"]

func getGoals():
	return {
		SexGoal.SubUndressSub: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
	}

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(_domInfo.goalsScoreMax({SexGoal.TieUp: 1.0}, _subInfo.charID) > 0.0):
		return 0.3 + max(_domInfo.getAngerScore(), 0.0)
	return 0.05 + max(_domInfo.getAngerScore(), 0.0)
	
func getStartActions(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var theitem = getItemToRemove(_subInfo.getChar())
	var thestate = theitem.getItemState()
	var theScore:float = getActivityScore(_sexEngine, _domInfo, _subInfo)
	addStartAction([theitem], "Strip "+str(theitem.getCasualName()), "Remove an item from sub", theScore)
	if(!thestate == null):
		addStartAction([theitem, "shift"], "Grab "+str(theitem.getCasualName()), "Shift an item worn by sub", theScore, {"isShift":true})

	return

func getTags(_indx:int) -> Array:
	if(_indx == SUB_0):
		return [SexActivityTag.BeingUndressed]
	return []

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var itemToUndress = getItemToRemove(_subInfo.getChar())
	if(itemToUndress == null):
		return false
	
	if(_sexEngine.hasTag(_subInfo.charID, SexActivityTag.OrderedToUndress)):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func startActivity(_args):
	#affectSub(getSubInfo().fetishScore({Fetish.Bodywritings: 1.0}, -0.25), 0.01, 0.0, -0.2, -0.02)
	var itemToUndress = getItemToRemove(getSub())
	if(itemToUndress == null):
		endActivity()
		return
	var casualName:String = str(itemToUndress.getCasualName())
	itemIDToRemove = itemToUndress.id
	if(_args.size() > 1):
		if(_args[1] == "shift"):
			addText("{dom.You} {dom.youVerb('reach', 'reaches')} to move aside {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName))
			isShift = true
	else:
		addText("{dom.You} {dom.youVerb('reach', 'reaches')} to take off {sub.yourHis} <ITEM>.".replace("<ITEM>", casualName))
	react(SexReaction.ForceUndress, [100, 100], [DOM_0, SUB_0], [casualName])
	return

func checkRemoved() -> bool:
	if(itemIDToRemove == null || itemIDToRemove == ""):
		return true
		
	var sub = getSub()
	var subDidIt = false
	var item = sub.getInventory().getEquippedItemByID(itemIDToRemove)
	if(item == null):
		subDidIt = true
	else:
		var itemState = item.getItemState()
		if(itemState.coversBodyparts()=={}):
			subDidIt = true
		if(itemState != null && itemState.isRemoved()):
			subDidIt = true
	
	return subDidIt

func init_processTurn():
	if(checkRemoved()):
		endActivity()
		return
		
	tick += 1

	if(tick > 1):
		var theitem:ItemBase = getSub().getInventory().getEquippedItemByID(itemIDToRemove)
		var itemState:ItemState = theitem.getItemState()
		var case = theitem.getClothingSlot()
		var hack = theitem.getVisibleName()
		if(hack.begins_with("Uniform Bottoms")):
			case = "underwearBottom"
		if(hack.begins_with("Uniform Shirt")):
			case = "underwearTop"
		if(itemState == null):
			getSub().getInventory().unequipItem(theitem)
		elif(isShift):
			match case:
				"body":
					if(itemState.isShirtOpened()):
						itemState.pullDownShorts()
						theitem.updateWearerAppearance()
					else:
						itemState.openShirt()
						theitem.updateWearerAppearance()
				"underwearTop":
					itemState.pullBraUp()
					theitem.updateWearerAppearance()
				"underwearBottom":
					itemState.shiftPantiesAside()
					theitem.updateWearerAppearance()
		else:
			itemState.remove()
		isShift = false
		endActivity()
		addText("{dom.You} {dom.youVerb('take')} off {sub.yourHis} "+str(theitem.getCasualName())+".")
		
func reactActivityEnd(_otheractivity):
	if(checkRemoved()):
		endActivity()


func getActions(_indx:int):
	if(_indx == SUB_0):
		if(!getSub().hasBoundArms()):
			var resistScore:float = getSubInfo().getResistScore() * 1.0 - fetish(SUB_0, Fetish.Exhibitionism) * getSubInfo().getComplyScore()
			addAction("resist", resistScore, "Resist undressing", "You don't wanna be undressed", {A_CHANCE: 70.0 - getDomInfo().getAngerScore()*60.0})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "resist"):
		if(RNG.chance(70.0 - getDomInfo().getAngerScore()*60.0)):
			getDomInfo().addAnger(0.3)
			endActivity()
			var damageText:String = ""
			if(RNG.chance(20)):
				damageText = damageClothes(SUB_0)
			addText("{sub.You} {sub.youVerb('manage', 'managed')} to resist {dom.yourHis} attempt to undress."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""))
			reactSub(SexReaction.ActivelyResisting, [50])
			fetishUp(SUB_0, Fetish.Exhibitionism, -3.0)
			return
		
		getDomInfo().addAnger(0.1)
		var damageText:String = ""
		if(RNG.chance(10)):
			damageText = damageClothes(SUB_0)
		addText("{sub.You} {sub.youVerb('try', 'tries')} to resist {dom.yourHis} hands but {sub.youVerb('fail')}."+((" Struggling leads to {dom.name} ripping {sub.your} clothes. "+damageText) if damageText != "" else ""))
		reactSub(SexReaction.Resisting, [50])
		fetishUp(SUB_0, Fetish.Exhibitionism, -5.0)
		return

func getItemToRemove(character):
	var bodypartsToExpose = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
	var canRemoveItems = []

	for bodypartToExpose in bodypartsToExpose:
		var firstItem = character.getFirstItemThatCoversBodypart(bodypartToExpose)
		if(firstItem != null && !canRemoveItems.has(firstItem) && !firstItem.isRestraint()):
			canRemoveItems.append(firstItem)
	return canRemoveItems.pop_front()

func saveData():
	var data = .saveData()
	
	data["itemIDToRemove"] = itemIDToRemove
	data["tick"] = tick

	return data
	
func loadData(data):
	.loadData(data)
	
	itemIDToRemove = SAVE.loadVar(data, "itemIDToRemove", "")
	tick = SAVE.loadVar(data, "tick", 0)
