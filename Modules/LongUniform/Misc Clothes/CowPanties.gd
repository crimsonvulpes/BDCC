extends ItemBase

func _init():
	id = "cowpanties"

func getVisibleName():
	return "Cowprint Panties"
	
func getDescription():
	var text = "A pair of panties that look pretty sturdy, for some reason, they feel kind of lively."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.OvulationEggsAmountBuff, [5]),
		buff(Buff.MaxStaminaBuff, [5]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your panties"
	else:
		return "slip down your panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the panties"
	else:
		return "put on the panties"

func getPrice():
	return 40

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Modules/LongUniform/Misc Clothes/CowPanties/CowPanties.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/cowpanties.png"
	
func canDye():
	return true
