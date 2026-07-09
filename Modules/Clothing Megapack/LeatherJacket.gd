extends ItemBase

var white = false

func _init():
	id = "leatherJacket"

func getVisibleName():
	if white:
		return "White Leather Jacket"
	return "Leather Jacket"
	
func getDescription():
	return "Too cool for school"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [10]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your leather jacket"
	else:
		return "takes off your leather jacket"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your leather jacket"
	else:
		return "puts on your leather jacket"

func getPrice():
	return 5

func canSell():
	return true

func coversBodyparts():
	return {
		BodypartSlot.Body: true,
		}

func getTags():
	return [ItemTag.SoldByUnderwearVendomat]

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if white:
		return {
		"sweater": "res://Modules/Clothing Megapack/White Leather Jacket/White Leather Jacket.tscn"
	}
	return {
		"sweater": "res://Modules/Clothing Megapack/Leather Jacket/Leather Jacket.tscn"
	}

func getInventoryImage():
	if white:
		return "res://Modules/Clothing Megapack/Icons/White Leather Jacket.png"
	return "res://Modules/Clothing Megapack/Icons/Leather Jacket.png"
