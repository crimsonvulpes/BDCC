extends ItemBase

func _init():
	id = "Phobos_Striped_Long_Gloves_1"

func getVisibleName():
	return "Striped Long Gloves 1"
	
func getDescription():
	var text = "Striped long gloves."

	return text

func getClothingSlot():
	return InventorySlot.Wrists

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 10]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your striped long gloves"
	else:
		return "slip down your striped long gloves"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the striped long gloves"
	else:
		return "put on the striped long gloves"

func getPrice():
	return 10

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null	
	return {
		"gloves": "res://Modules/Striped_Clothes/Clothing/striped/gloves/img/gloves1.tscn"
	}

func getInventoryImage():
	return "res://Modules/Striped_Clothes/Clothing/striped/gloves/img/icon1.png"	
	
func canDye():
	return true
