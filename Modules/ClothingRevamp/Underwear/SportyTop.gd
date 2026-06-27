extends ItemBase

func _init():
	id = "sportyTop"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Sporty Top"
	
func getDescription():
	var text = "A cotton top designed to give breasts support during exercises."

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
		return "takes off your sporty top"
	else:
		return "take off your sporty top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the sporty top"
	else:
		return "put on the sporty top"

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "top"
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"bra": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTop_dam.tscn",
		}
	if(itemState.isBraPulledUp()):
		return {"top": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTop_pulledup.tscn",}

	return {
		"bra": "res://Modules/ClothingRevamp/Underwear/underwear_assets/SportyTop.tscn",
	}

func getInventoryImage():
	return "res://Images/Items/underwear/sport-bra.png"

func canDye():
	return true
