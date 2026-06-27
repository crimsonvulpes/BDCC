extends ItemBase

func _init():
	id = "plainUndershirt"
	clothesColor = Color(0.19, 0.19, 0.19)

func getVisibleName():
	return "Undershirt"
	
func getDescription():
	var text = "Sleeveless shirt that covers your chest."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
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
		return "takes off your undershirt"
	else:
		return "take off your undershirt"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the undershirt"
	else:
		return "put on the undershirt"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = BraState.new()
	itemState.casualName = "undershirt"
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(itemState.isDamaged()):
		return {
			"top": "res://Inventory/RiggedModels/Undershirt/UndershirtDamaged.tscn",
		}
	if(itemState.isBraPulledUp()):
		return {"bra": "res://Modules/ClothingRevamp/Underwear/underwear_assets/Undershirt_pulledup.tscn",}
	
	return {
		"top": "res://Inventory/RiggedModels/Undershirt/Undershirt.tscn",
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
