extends ItemBase

func _init():
	id = "Phobos_Striped_Stockings_2"

func getVisibleName():
	return "Striped Stockings 2"
	
func getDescription():
	return "Striped stockings without socks for digitigrade feet."

func getClothingSlot():
	return InventorySlot.Ankles

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 10]),
		]
	
func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your striped stockings without socks"
	else:
		return "take off your striped stockings without socks"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the striped stockings without socks" 
	else:
		return "put on the striped stockings without socks"
		
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
		"sock": "res://Modules/Striped_Clothes/Clothing/striped/stockings/img/stockings2.tscn"
	}

func getInventoryImage():
	return "res://Modules/Striped_Clothes/Clothing/striped/stockings/img/icon2.png"	
	
func canDye():
	return true
