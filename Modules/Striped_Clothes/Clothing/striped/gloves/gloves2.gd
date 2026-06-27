extends ItemBase

func _init():
	id = "Phobos_Striped_Long_Gloves_2"

func getVisibleName():
	return "Striped Long Gloves 2"
	
func getDescription():
	var text = "Striped long gloves without fingers."

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
		return "slips down your striped long gloves without fingers"
	else:
		return "slip down your striped long gloves without fingers"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the striped long gloves without fingers"
	else:
		return "put on the striped long gloves without fingers"

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
		"gloves": "res://Modules/Striped_Clothes/Clothing/striped/gloves/img/gloves2.tscn"
	}

func getInventoryImage():
	return "res://Modules/Striped_Clothes/Clothing/striped/gloves/img/icon2.png"	
	
func canDye():
	return true
