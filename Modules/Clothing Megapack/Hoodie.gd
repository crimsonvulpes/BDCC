extends ItemBase

func _init():
	id = "hoodie"

func getVisibleName():
	return "Hoodie"
	
func getDescription():
	return "A hoodie, comfy and cozy"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your hoodie"
	else:
		return "takes off your hoodie"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your hoodie"
	else:
		return "puts on your hoodie"

func getPrice():
	return 5

func canSell():
	return true

func coversBodyparts():
	return {
		BodypartSlot.Body: true,
		BodypartSlot.Breasts: true,
		}

func getTags():
	return [ItemTag.SoldByUnderwearVendomat]

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"sweater": "res://Modules/Clothing Megapack/Hoodie/Hoodie.tscn"
	}

func getInventoryImage():
	return "res://Modules/Clothing Megapack/Icons/Hoodie.png"
