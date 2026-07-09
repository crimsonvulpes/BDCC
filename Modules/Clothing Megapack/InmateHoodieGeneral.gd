extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General
var white = false

func _init():
	id = "inmatehoodie"

func getVisibleName():
	if white:
		return "White " + InmateType.getOfficialName(inmateType).capitalize() + " inmate hoodie"
	return InmateType.getOfficialName(inmateType).capitalize() + " inmate hoodie"

func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber

func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A hoodie, comfy and cozy with "+InmateType.getColorName(inmateType)+" lines."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The hoodie has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Torso

func coversBodyparts():
	return {
		BodypartSlot.Body: true,
		BodypartSlot.Breasts: true,
		}

func getPrice():
	return 5

func getTags():
	return [
		ItemTag.SoldByUnderwearVendomat,
		]

func getBuffs():
	return [
		buff(Buff.PhysicalArmorBuff, [4]),
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
		return "takes off your inmate hoodie"
	else:
		return "take off your inmate hoodie"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate hoodie"
	else:
		return "put on your inmate hoodie"

#func generateItemState():
#	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
		if white:
			return {
			"hoodie": "res://Modules/Clothing Megapack/W Hoodie Lilac/W_Hoodie_Lilac.tscn"
		}
		else:
			return {
				"hoodie": "res://Modules/Clothing Megapack/Hoodie Lilac/Hoodie_Lilac.tscn"
			}
	elif(inmateType == InmateType.HighSec):
		if white:
			return {
			"hoodie": "res://Modules/Clothing Megapack/W Hoodie Red/W_Hoodie_Red.tscn"
		}
		else:
			return {
				"hoodie": "res://Modules/Clothing Megapack/Hoodie Red/Hoodie_Red.tscn"
			}
	if white:
		return {
		"hoodie": "res://Modules/Clothing Megapack/W Hoodie Orange/W_Hoodie_Orange.tscn"
	}
	else:
		return {
			"hoodie": "res://Modules/Clothing Megapack/Hoodie Orange/Hoodie_Orange.tscn"
		}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		if white:
			return "res://Modules/Clothing Megapack/Icons/Hoodie White Lilac.png"
		else:
			return "res://Modules/Clothing Megapack/Icons/Hoodie Lilac.png"
	elif(inmateType == InmateType.HighSec):
		if white:
			return "res://Modules/Clothing Megapack/Icons/Hoodie White Red.png"
		else:
			return "res://Modules/Clothing Megapack/Icons/Hoodie Red.png"
	if white:
		return "res://Modules/Clothing Megapack/Icons/Hoodie White Orange.png"
	else:
		return "res://Modules/Clothing Megapack/Icons/Hoodie Orange.png"
