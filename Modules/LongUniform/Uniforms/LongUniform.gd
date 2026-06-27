extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General

func _init():
	id = "inmateuniformlong"

func getVisibleName():
	return "Inmate Uniform Upgraded (" + InmateType.getOfficialName(inmateType).capitalize() +")"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A long-sleeved shirt and a pair of pants, both are made out of black cloth with "+InmateType.getColorName(inmateType)+" trim."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The shirt has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.ExposureBuff, [-10]),
		buff(Buff.LustDamageBuff, [-10]),
		buff(Buff.LustArmorBuff, [10])
		]

func getPrice():
	return 25

func getTags():
	return [
		ItemTag.GeneralInmateUniform,
		ItemTag.SoldByUnderwearVendomat
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
		return "takes off your inmate shirt and pulls down the pants"
	else:
		return "take off your inmate shirt and pull down the pants"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt and the pants"
	else:
		return "put on your inmate shirt and the pants"

func generateItemState():
	itemState = ShirtAndShortsState.new()
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniL/Heavy Damage/LongUniformL_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniL/Damage/LongUniformL_Dam2.tscn",
			}
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniL/Light Damage/LongUniformL_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/LongUniL/LongUniformL.tscn",
		}
	elif(inmateType == InmateType.HighSec):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniR/Heavy Damage/LongUniformR_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniR/Damage/LongUniformR_Dam2.tscn",
			}
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniR/Light Damage/LongUniformR_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/LongUniR/LongUniformR.tscn",
		}
	if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniO/Heavy Damage/LongUniformO_Dam3.tscn",
			}
	if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniO/Damage/LongUniformO_Dam2.tscn",
			}
	if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/LongUniO/Light Damage/LongUniformO_Dam1.tscn",
			}
	return {
		"clothing": "res://Modules/LongUniform/Uniforms/LongUniO/LongUniformO.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Modules/LongUniform/ItemIcons/shirtlilac+.png"
	if(inmateType == InmateType.HighSec):
		return "res://Modules/LongUniform/ItemIcons/shirtred+.png"
	return "res://Modules/LongUniform/ItemIcons/shirtorange+.png"
