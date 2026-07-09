extends ItemBase

var prisonerNumber = ""

func _init():
	id = "inmateshortuniformNeutral"

func getVisibleName():
	return  "Neutral inmate short uniform"

func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber

func getDescription():
	var text = "A sleeveless top and some shorts, both are made out of black cloth with grey trim."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The top has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your inmate top and pulls down the shorts"
	else:
		return "take off your inmate top and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate top and the shorts"
	else:
		return "put on your inmate top and the shorts"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Modules/ContrabandClothesModule/GreyShortUniform/GreyInmateShortUniform.tscn"
	}

func getInventoryImage():
	return "res://Modules/Clothing Megapack/GreyShortUniform/neutralshortUniform.png"
