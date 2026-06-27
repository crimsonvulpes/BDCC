extends ItemBase

func _init():
	id = "sportyTankTop"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Sporty Tank Top"
	
func getDescription():
	var text = "A cotton tank top, perfect to wear during exercises."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [5]),
		buff(Buff.StatBuff, [Stat.Agility, 2]),
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
		return "takes off your sporty tank top"
	else:
		return "take off your sporty tank top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty tank top"
	else:
		return "put on the sporty tank top"

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "tanktop"
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"top": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTank_dam.tscn",
		}
	if(itemState.isBraPulledUp()):
		return {"top": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTank_pulledup.tscn",}
	
	return {
		"top": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTank.tscn",
	}

func getHidesParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp() || itemState.isDamaged()):
		return null
	return {
		BodypartSlot.Breasts: true,
	}

func getInventoryImage():
	return "res://Images/Items/underwear/tanktop.png"

func canDye():
	return true
