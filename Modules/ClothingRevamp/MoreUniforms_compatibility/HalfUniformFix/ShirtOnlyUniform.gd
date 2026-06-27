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
	
func getBuffs():
	return [
		buff(Buff.ExposureBuff, [5]),
		]
		
func getPossibleActions():
	if(!self.isWornByWearer() || self.isDamaged()):
		return []
	return [
		{
			"name": "Shift Clothes",
			"scene": "ClothingAdjustState",
			"description": "Change how your clothes are worn",
		},
	]

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



func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/Heavy Damage/LilacUni_ShirtOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/Damage/LilacUni_ShirtOnly_Dam2.tscn",
#				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyL/Heavy Damage/LilacUni_ShirtOnly_Dam3.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			if(itemState.isShirtOpened()):
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/LilacUni_shirtpulledup.tscn",
#					}
#			else:
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/Light Damage/LilacUni_ShirtOnly_Dam1.tscn",
#				}
		if(itemState.isBraPulledUp()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/LilacUni_shirtpulledup.tscn",
				}
		return {
			"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyL/LilacUni_ShirtOnly.tscn",
		}
	elif(inmateType == InmateType.HighSec):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/Heavy Damage/RedUni_ShirtOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/Damage/RedUni_ShirtOnly_Dam2.tscn",
#				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyR/Heavy Damage/RedUni_ShirtOnly_Dam3.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			if(itemState.isShirtOpened()):
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/RedUni_shirtpulledup.tscn",
#					}
#			else:
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/Light Damage/RedUni_ShirtOnly_Dam1.tscn",
#				}
		if(itemState.isBraPulledUp()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/RedUni_shirtpulledup.tscn",
				}
		return {
			"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyR/RedUni_ShirtOnly.tscn",
		}
#	if(itemState.isSuperDamaged()):
#			return {
#				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/Heavy Damage/GeneralUni_ShirtOnly_Dam3.tscn",
#			}
	if(itemState.isDamaged()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/Damage/GeneralUni_ShirtOnly_Dam2.tscn",
#				"shirt": "res://Modules/LongUniform/Uniforms/ShirtOnlyO/Heavy Damage/GeneralUni_ShirtOnly_Dam3.tscn",
			}
#	if(itemState.isHalfDamaged()):
#			if(itemState.isShirtOpened()):
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/GeneralUni_shirtpulledup.tscn",
#					}
#			else:
#				return {
#					"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/Light Damage/GeneralUni_ShirtOnly_Dam1.tscn",
#				}
	if(itemState.isBraPulledUp()):
			return {
				"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/GeneralUni_shirtpulledup.tscn",
				}
	return {
		"shirt": "res://Modules/ClothingRevamp/Uniforms/ShirtOnlyO/GeneralUni_ShirtOnly.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Images/Items/equipment/shirtlilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Images/Items/equipment/shirtred.png"
	return "res://Images/Items/equipment/shirtorange.png"
