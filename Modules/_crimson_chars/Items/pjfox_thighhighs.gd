extends ItemBase

func _init():
	id = "pjfox_thighighs"

func getVisibleName():
	return "pjfox_thighighs"
	
func getDescription():
	return "Striped stockings for digitigrade feet."

func getClothingSlot():
	return InventorySlot.Ankles

func getBuffs():
	return [
		buff(Buff.LustArmorBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 10]),
		]
	
func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your stockings"
	else:
		return "take off your stockings"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the stockings" 
	else:
		return "put on the stockings"
		
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
		"sock": "res://Modules/_crimson_chars/Items/Textures/pjfox_thigh_highs/pjfox_thigh_highs.tscn"
	}

func getInventoryImage():
	return "res://icon.png"	
	
func canDye():
	return true
