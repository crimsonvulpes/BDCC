extends ItemBase

var inmateType = InmateType.General

func _init():
	id = "bottomsonlyuniform"

func getVisibleName():
	return "Uniform Bottoms(" + InmateType.getOfficialName(inmateType).capitalize() +")"
	
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	return "A set of shorts that with "+InmateType.getColorName(inmateType)+" trim. They look tight in the back..."


func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.ExposureBuff, [5]),
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
	itemState.canShiftAside = false
	itemState.casualName = "shorts"
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyL/Heavy Damage/LilacUni_ShortsOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyL/Damage/LilacUni_BottomssOnly_Dam2.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyL/Light Damage/LilacUni_ShortsOnly_Dam1.tscn",
#			}
		return {
			"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyL/LilacUni_BottomsOnly.tscn",
		}
	elif(inmateType == InmateType.HighSec):
#		if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyR/Heavy Damage/RedUni_ShortsOnly_Dam3.tscn",
#			}
		if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyR/Damage/RedUni_BottomsOnly_Dam2.tscn",
			}
#		if(itemState.isHalfDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyR/Light Damage/RedUni_ShortsOnly_Dam1.tscn",
#			}
		return {
			"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyR/RedUni_BottomsOnly.tscn",
		}
#	if(itemState.isSuperDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyO/Heavy Damage/GeneralUni_ShortsOnly_Dam3.tscn",
#			}
	if(itemState.isDamaged()):
			return {
				"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyO/Damage/GeneralUni_BottomsOnly_Dam2.tscn",
			}
#	if(itemState.isHalfDamaged()):
#			return {
#				"shorts": "res://Modules/LongUniform/BottomsOnlyO/Light Damage/GeneralUni_ShortsOnly_Dam1.tscn",
#			}
	return {
		"shorts": "res://Modules/LongUniform/Uniforms/BottomsOnlyO/GeneralUni_BottomsOnly.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Modules/LongUniform/ItemIcons/ShortsLilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Modules/LongUniform/ItemIcons/ShortsRed.png"
	return "res://Modules/LongUniform/ItemIcons/ShortsOrange.png"
