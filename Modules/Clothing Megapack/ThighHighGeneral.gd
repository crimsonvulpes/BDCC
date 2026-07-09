extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General
var white = false

func _init():
	id = "thighhigh"

func getVisibleName():
	if white:
		return "White " + InmateType.getOfficialName(inmateType).capitalize() + " tigh high"
	return InmateType.getOfficialName(inmateType).capitalize() + " tigh high"

func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "thigh highs made out of inmates uniforms .. to keep those legs warm. It decorated with "+InmateType.getColorName(inmateType)+" trim."
	
	return text

func getClothingSlot():
	return InventorySlot.Ankles

func getPrice():
	return 5

func coversBodyparts():
	return {
		BodypartSlot.Legs: true,
		}

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func getBuffs():
	return [
		buff(Buff.StatBuff, [Stat.Sexiness, 7]),
		]

func saveData():
	var data = .saveData()

	data["inmateType"] = inmateType
	
	return data
	
func loadData(data):
	.loadData(data)

	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your thigh high"
	else:
		return "take off your thigh high"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your thigh high"
	else:
		return "put on your tigh high"

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
		if white:
			return {
			"sock": "res://Modules/Clothing Megapack/WhiteSexDeviantThighHigh/WhiteSexDeviantThighHigh.tscn"
		}
		return {
			"sock": "res://Modules/Clothing Megapack/SexDeviantThighHigh/SexDeviantThighHigh.tscn"
		}
	elif(inmateType == InmateType.HighSec):
		if white:
			return {
			"sock": "res://Modules/Clothing Megapack/WhiteHighSecThighHigh/WhiteHighSecThighHigh.tscn"
		}
		return {
			"sock": "res://Modules/Clothing Megapack/HighSecThighHigh/HighSecThighHigh.tscn"
		}
	
	if white:
		return {
			"sock": "res://Modules/Clothing Megapack/WhiteGeneralThighHigh/GeneralThighHigh.tscn"
		}
	return {
		"sock": "res://Modules/Clothing Megapack/GeneralThighHigh/GeneralThighHigh.tscn"
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		if white:
			return "res://Modules/Clothing Megapack/Icons/White Thigh High Lilac.png"
		else:
			return "res://Modules/Clothing Megapack/Icons/Thigh High Lilac.png"
	elif(inmateType == InmateType.HighSec):
		if white:
			return "res://Modules/Clothing Megapack/Icons/White Thigh High Red.png"
		else:
			return "res://Modules/Clothing Megapack/Icons/Thigh High Red.png"
	if white:
		return "res://Modules/Clothing Megapack/Icons/White Thigh High Orange.png"
	else:
		return "res://Modules/Clothing Megapack/Icons/Thigh High Orange.png"
