extends ItemBase

func _init():
	id = "cowbra"

func getVisibleName():
	return "Cowprint Bra"
	
func getDescription():
	var text = "A sturdy looking bra that looks able to hold a lot of weight. Seems like whatever has been done with it, your breasts will naturally be able to hold an extra cup size of milk so long as you wear it."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.BreastsLactatingSizeLimitBuff, [1]),
		]

func getPossibleActions():
	if(!self.isWornByWearer() || self.isDamaged() || self.getWearer().isInventorySlotBlocked(InventorySlot.UnderwearTop)):
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
		return "takes off your cowprint bra"
	else:
		return "take off your cowprint bra"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the cowprint bra"
	else:
		return "put on the cowprint bra"

func getPrice():
	return 55

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		]

#Damage will come later lol

func generateItemState():
	itemState = BraState.new()
	itemState.canActuallyBeDamaged = false

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	if(itemState.isBraPulledUp()):
		return {"bra": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/CowBra/CowBra_pulledaside.tscn",}
	
	return {
		"bra": "res://Modules/LongUniform/Misc Clothes/CowBra/CowBra.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/cowbra.png"

func canDye():
	return true
