extends ItemBase

var white

func _init():
	id = "kittyPanties"

func getVisibleName():
	if white:
		return "White Kitty Panties"
	return "Kitty Panties"
	
func getDescription():
	var text = "Kitty panties, meow :3"

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Sexiness, 5]),
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "slips down your kitty panties"
	else:
		return "slip down your kitty panties"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on the kitty panties"
	else:
		return "put on the kitty panties"


func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func generateItemState():
	itemState = PantiesState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if white:
		return {
		"panties": "res://Modules/Clothing Megapack/White Kitty Panties/White Kitty Panties.tscn"
	}
	return {
		"panties": "res://Modules/Clothing Megapack/Kitty Panties/Kitty Panties.tscn"
	}

func getInventoryImage():
	if white:
		return "res://Modules/Clothing Megapack/Icons/White Kitty Panty.png"
	return "res://Modules/Clothing Megapack/Icons/Kitty Panty.png"
