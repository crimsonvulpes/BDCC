extends ItemBase

var white

func _init():
	id = "cropTop"

func getVisibleName():
	if white:
		return "White Crop Top"
	return "Crop Top"
	
func getDescription():
	return "tight and short piece of clothing"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Sexiness, 3]),
		buff(Buff.StatBuff, [Stat.Agility, 2]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your crop tops"
	else:
		return "takes off your crop top"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your crop top"
	else:
		return "puts on your crop top"

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
		"clothing": "res://Modules/Clothing Megapack/White Crop Top/WhiteCropTop.tscn"
	}
	return {
		"clothing": "res://Modules/Clothing Megapack/Crop Top/CropTop.tscn"
	}

func getInventoryImage():
	if white:
		return "res://Modules/Clothing Megapack/Icons/White Croptop.png"
	return "res://Modules/Clothing Megapack/Icons/Croptop.png"
	
