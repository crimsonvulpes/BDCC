extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General

func _init():
	id = "shirtonlyuniform"

func getVisibleName():
	return "Uniform Shirt (" + InmateType.getOfficialName(inmateType).capitalize() +")"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A cut shirt and just that with "+InmateType.getColorName(inmateType)+" trim."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The shirt has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getPrice():
	return 10

func getTags():
	return [
		ItemTag.GeneralInmateUniform,
		ItemTag.SoldByGeneralVendomat
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
		return "takes off your inmate shirt"
	else:
		return "take off your inmate shirt"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt"
	else:
		return "put on your inmate shirt"

func generateItemState():
	itemState = BraState.new()
	itemState.canActuallyBeDamaged = true

#Shirt and Shorts State hides the dick when worn and un-damaged
#Bra state only allows one state of damage

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyL/Heavy Damage/LilacUni_ShirtOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyL/Damage/LilacUni_ShirtOnly_Dam2.tscn",
				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyL/Heavy Damage/LilacUni_ShirtOnly_Dam3.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyL/Light Damage/LilacUni_ShirtOnly_Dam1.tscn",
#			}
		return {
			"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyL/LilacUni_ShirtOnly.tscn",
		}
	elif(inmateType == InmateType.HighSec):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyR/Heavy Damage/RedUni_ShirtOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyR/Damage/RedUni_ShirtOnly_Dam2.tscn",
				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyR/Heavy Damage/RedUni_ShirtOnly_Dam3.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyR/Light Damage/RedUni_ShirtOnly_Dam1.tscn",
#
#			}
		return {
			"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyR/RedUni_ShirtOnly.tscn",
		}
#	if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyO/Heavy Damage/GeneralUni_ShirtOnly_Dam3.tscn",
#			}
	if(itemState.isDamaged()):
			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyO/Damage/GeneralUni_ShirtOnly_Dam2.tscn",
				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyO/Heavy Damage/GeneralUni_ShirtOnly_Dam3.tscn",
			}
#	if(itemState.isHalfDamaged()):
#			return {
#				"shirt": "res://Modules/LongUniform/ShirtOnlyO/Light Damage/GeneralUni_ShirtOnly_Dam1.tscn",
#			}
	return {
		"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyO/GeneralUni_ShirtOnly.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Images/Items/equipment/shirtlilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Images/Items/equipment/shirtred.png"
	return "res://Images/Items/equipment/shirtorange.png"
