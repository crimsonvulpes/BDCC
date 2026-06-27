extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General

func _init():
	id = "croptopuniform"

func getVisibleName():
	return "Cut Top Uniform (" + InmateType.getOfficialName(inmateType).capitalize() +")"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A cut shirt and a pair of shorts, both are made out of black cloth with "+InmateType.getColorName(inmateType)+" trim. This one had it's shirt cut to completely show off the stomach and midriff. Could help you show off but whatever cut it didnt do it too well..."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The shirt has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.LustDamageBuff, [10]),
		buff(Buff.DodgeChanceBuff, [10]),
		buff(Buff.ReceivedPhysicalDamageBuff, [5])
		]

func getPrice():
	return 15

func getTags():
	return [
		ItemTag.GeneralInmateUniform,
		ItemTag.SoldByUnderwearVendomat
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
		return "takes off your inmate shirt and pulls down the shorts"
	else:
		return "take off your inmate shirt and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt and the shorts"
	else:
		return "put on your inmate shirt and the shorts"

func generateItemState():
	itemState = ShirtAndShortsState.new()
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopL/Heavy Damage/LilacCropTop_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopL/Damage/LilacCropTop_Dam2.tscn",
			}
		if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
			if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
				return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformLilac/LilacUni_both.tscn",}
			if(itemState.isShirtOpened()):
				return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformLilac/LilacUni_shirtpulledup.tscn",}
			else:
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/CropTop/LilacCropTop.tscn",}
		
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopL/Light Damage/LilacCropTop_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/CropTopL/LilacCropTop.tscn",
		}
	elif(inmateType == InmateType.HighSec):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopR/Heavy Damage/RedCropTop_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopR/Damage/RedCropTop_Dam2.tscn",
			}
		if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
			if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
				return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformRed/RedUni_both.tscn",}
			if(itemState.isShirtOpened()):
				return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformRed/RedUni_shirtpulledup.tscn",}
			else:
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibilityCropTop/RedCropTop.tscn",}
		
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopR/Light Damage/RedCropTop_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/CropTopR/RedCropTop.tscn",
		}
	if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopO/Heavy Damage/OrangeCropTop_Dam3.tscn",
			}
	if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopO/Damage/OrangeCropTop_Dam2.tscn",
			}
	if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
		if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
			return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformGeneral/GeneralUni_both.tscn",}
		if(itemState.isShirtOpened()):
			return {"clothing": "res://Modules/ClothingRevamp/Uniforms/UniformGeneral/GeneralUni_shirtpulledup.tscn",}
		else:
			return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/CropTop/OrangeCropTop.tscn",}
	
	if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/CropTopO/Light Damage/OrangeCropTop_Dam1.tscn",
			}
	return {
		"clothing": "res://Modules/LongUniform/Uniforms/CropTopO/OrangeCropTop.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Images/Items/equipment/shirtlilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Images/Items/equipment/shirtred.png"
	return "res://Images/Items/equipment/shirtorange.png"
