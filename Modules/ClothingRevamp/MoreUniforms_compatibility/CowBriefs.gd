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

func getPossibleActions():
	if(!self.isWornByWearer() || self.isDamaged() || self.getWearer().isInventorySlotBlocked(InventorySlot.UnderwearBottom)):
		return []
	return [
		{
			"name": "Shift Clothes",
			"scene": "ClothingAdjustState",
			"description": "Change how your clothes are worn",
		},
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
	itemState.canShiftAside = true
	itemState.casualName = "briefs"
	itemState.canActuallyBeDamaged = false

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.arePantiesShiftedAside()):
		return {"panties": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/CowBriefs/CowBriefs_pulledaside.tscn"}
	
	return {
		"panties": "res://Modules/LongUniform/Misc Clothes/CowBriefs/CowBriefs.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/cowboxers.png"

func canDye():
	return true
