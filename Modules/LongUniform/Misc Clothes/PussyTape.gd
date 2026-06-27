extends ItemBase

func _init():
	id = "pussytape"

func getVisibleName():
	return "Pussy Tape"
	
func getDescription():
	var text = "A strip of black tape covering you groin area, useful for covering your pussy and not covering a set of cock and balls"

	return text

func getClothingSlot():
	return InventorySlot.UnderwearBottom

func getBuffs():
	return [
		buff(Buff.LustDamageBuff, [15]),
		buff(Buff.BlocksVaginaLeakingBuff, [75]),
#		buff(Buff.ChastityVaginaBuff)
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "peels the tape off your privates. Ow."
	else:
		return "peel the tape off your privates. Ow."

func getPuttingOnStringLong(withS):
	if(withS):
		return "sticks some tape to your crotch"
	else:
		return "stuck some tape to your crotch"

func getPrice():
	return 1

func getTags():
	return [
		ItemTag.SoldByGeneralVendomat,
		]

#func generateItemState():
#	itemState = PantiesState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"pantiestape": "res://Modules/LongUniform/Misc Clothes/PussyTape/PussyTape.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/TapeIcon.png"

func canDye():
	return true
