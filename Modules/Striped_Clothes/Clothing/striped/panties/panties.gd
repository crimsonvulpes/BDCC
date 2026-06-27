extends ItemBase

var NameItem = "Striped Panties"

func _init():
	id = "Phobos_Striped_Panties"

func getVisibleName():
	return "Striped Panties"
	
func getDescription():
	var text = "Striped Panties."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [5]),
		buff(Buff.StatBuff, [Stat.Sexiness, 5]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your striped panties"
	else:
		return "slip down your striped panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the striped panties"
	else:
		return "put on the striped panties"

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]
		
func generateItemState():
	itemState = PantiesState.new()
	itemState.canActuallyBeDamaged = false

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null	
	return {
		"panties": "res://Modules/Striped_Clothes/Clothing/striped/panties/img/panties.tscn"
	}

func getInventoryImage():
	return "res://Modules/Striped_Clothes/Clothing/striped/panties/img/icon.png"	
	
func canDye():
	return true
