extends ItemBase

func _init():
	id = "pjfoxhoodie"

func getVisibleName():
	return "PJFox's Hoodie"
	
func getDescription():
	return "A hoodie, comfy and cozy"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Sexiness, 5]),
		buff(Buff.StatBuff, [Stat.Agility, 4]),
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
		"sweater": "res://Modules/_crimson_chars/Items/Textures/pjfox_hoodie/pjfox_hoodie.tscn"
	}

func getInventoryImage():
	return "res://icon.png"
