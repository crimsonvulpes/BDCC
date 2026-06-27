extends ItemBase

var inmateType = InmateType.General

func _init():
	id = "bottomsonlyuniform"

func getVisibleName():
	return "Uniform Bottoms(" + InmateType.getOfficialName(inmateType).capitalize() +")"
	
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	return "A set of fucking shorts with "+InmateType.getColorName(inmateType)+" trim. They look tight in the back..."


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
	data["inmateType"] = inmateType
	
	return data
	
func loadData(data):
	.loadData(data)
	
	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your inmate shorts"
	else:
		return "take off your inmate shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shorts"
	else:
		return "put on your inmate shorts"

func generateItemState():
	itemState = PantiesState.new()
	itemState.canActuallyBeDamaged = true
	itemState.canShiftAside = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/Heavy Damage/LilacUni_BottomsOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/Damage/LilacUni_BottomssOnly_Dam2.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			if(itemState.areShortsPulledDown()):
#				return {
#					"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/LilacUni_shortspulleddown.tscn",
#					}
#			else:
#				return {
#					"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/Light Damage/LilacUni_BottomsOnly_Dam1.tscn",
#				}
		if(itemState.arePantiesShiftedAside()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/LilacUni_shortspulleddown.tscn",
				}
		return {
			"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyL/LilacUni_BottomsOnly.tscn",
		}
	elif(inmateType == InmateType.HighSec):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/Heavy Damage/RedUni_BottomsOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/Damage/RedUni_BottomsOnly_Dam2.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			if(itemState.areShortsPulledDown()):
#				return {
#					"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/RedUni_shortspulleddown.tscn",
#					}
#			else:
#				return {
#					"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/Light Damage/RedUni_BottomsOnly_Dam1.tscn",
#				}
		if(itemState.arePantiesShiftedAside()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/RedUni_shortspulleddown.tscn",
				}
		return {
			"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyR/RedUni_BottomsOnly.tscn",
		}
#	if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/Heavy Damage/GeneralUni_BottomsOnly_Dam3.tscn",
#			}
	if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/Damage/GeneralUni_BottomsOnly_Dam2.tscn",
			}
#	if(itemState.isHalfDamaged()):
#		if(itemState.areShortsPulledDown()):
#			return {
#				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/GeneralUni_BottomsOnly_shortspulleddown.tscn",
#				}
#		else:
#			return {
#				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/Light Damage/GeneralUni_BottomsOnly_Dam1.tscn",
#			}
	if(itemState.arePantiesShiftedAside()):
			return {
				"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/GeneralUni_BottomsOnly_shortspulleddown.tscn",
				}
	return {
		"shorts": "res://Modules/ClothingRevamp/Uniforms/BottomsOnlyO/GeneralUni_BottomsOnly.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Modules/ClothingRevamp/ItemIcons/ShortsLilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Modules/ClothingRevamp/ItemIcons/ShortsRed.png"
	return "res://Modules/ClothingRevamp/ItemIcons/ShortsOrange.png"
