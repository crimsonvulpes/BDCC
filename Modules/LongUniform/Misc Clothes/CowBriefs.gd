extends ItemBase

func _init():
	id = "cowbriefs"

func getVisibleName():
	return "Cowprint Briefs"
	
func getDescription():
	var text = "A set of briefs with a cow print. They feel pretty sturdy and for some reason, lively."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.PenisCumProductionBuff, [10]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your briefs"
	else:
		return "slip down your briefs"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the briefs"
	else:
		return "put on the briefs"

func getPrice():
	return 50

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()
	itemState.canShiftAside = false
	itemState.casualName = "briefs"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"panties": "res://Modules/LongUniform/Misc Clothes/CowBriefs/CowBriefs.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/cowboxers.png"

func canDye():
	return true
