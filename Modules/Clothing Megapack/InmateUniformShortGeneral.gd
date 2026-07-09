extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General
var white = false

func _init():
	id = "inmateshortuniform"

func getVisibleName():
	if white:
		return "white " + InmateType.getOfficialName(inmateType).capitalize() + " inmate short uniform"
	return InmateType.getOfficialName(inmateType).capitalize() + " inmate short uniform"

func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber

func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var color = "black"
	if white:
		color = "white"
	var text = "A sleeveless top and some shorts, both are made out of " + color + " cloth with "+InmateType.getColorName(inmateType)+" trim."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The top has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Sexiness, 10]),
		]

func saveData():
	var data = .saveData()
	
	data["prisonerNumber"] = prisonerNumber
	data["inmateType"] = inmateType
	
	return data
	
func loadData(data):
	.loadData(data)
	
	prisonerNumber = SAVE.loadVar(data, "prisonerNumber", "")
	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)

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
	if(inmateType == InmateType.SexDeviant):
		if white:
			return {
			"clothing": "res://Modules/Clothing Megapack/WhiteSexualDeviantShortUniform/WhiteLilacInmateShortUniform.tscn"
		}
		return {
			"clothing": "res://Modules/Clothing Megapack/SexualDeviantShortUniform/LilacInmateShortUniform.tscn"
		}
	elif(inmateType == InmateType.HighSec):
		if white:
			return {
			"clothing": "res://Modules/Clothing Megapack/WhiteHighSecShortUniform/WhiteRedInmateShortUniform.tscn"
		}
		return {
			"clothing": "res://Modules/Clothing Megapack/HighSecShortUniform/RedInmateShortUniform.tscn"
		}
	
	if white:
		return {
			"clothing": "res://Modules/Clothing Megapack/WhiteGeneralShortUniform/WhiteOrangeInmateShortUniform.tscn"
		}
	return {
		"clothing": "res://Modules/Clothing Megapack/GeneralShortUniform/OrangeInmateShortUniform.tscn"
	}

func getInventoryImage():
	return "res://Modules/Clothing Megapack/Icons/Short Uniform Orange.png"
