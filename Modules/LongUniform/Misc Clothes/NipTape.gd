extends ItemBase

func _init():
	id = "niptape"

func getVisibleName():
	return "Nipple Tape"
	
func getDescription():
	var text = "The least amount of effort you could put into covering yourself up."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return [
		buff(Buff.LustDamageBuff, [5]),
		buff(Buff.BreastsMilkProductionBuff, [-5])
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes the tape off your nipples"
	else:
		return "take the tape off your nipples"

func getPuttingOnStringLong(withS):
	if(withS):
		return "sticks some tape on your nipples"
	else:
		return "stuck some tape on your nipples"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByGeneralVendomat,
		]

func generateItemState():
	itemState = BraState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
	return {
		"breasttape": "res://Modules/LongUniform/Misc Clothes/NipTape/NipTape.tscn",
		}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/TapeIcon.png"

func canDye():
	return true
