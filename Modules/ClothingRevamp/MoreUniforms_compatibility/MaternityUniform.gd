extends ItemBase

var inmateType = InmateType.General

func _init():
	id = "maternityuniform"

func getVisibleName():
	return "Maternity Uniform (" + InmateType.getOfficialName(inmateType).capitalize() +")"
	

func getDescription():
	return "A long-sleeved shirt and a pair of pants, both are made out of black cloth with "+InmateType.getColorName(inmateType)+" trim. Modified to cut away the stomach and midriff of the uniform to help with inmates who are pregnant often. Some extra padding and what feels like a different, better, fabric might help you get some extra rest if you can ignore the big hole in the stomach."

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.RestEffectivenessBuff, [50]),
		buff(Buff.BreastsMilkProductionBuff, [5]),
		buff(Buff.PenisCumProductionBuff, [5]),
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
	return 60

func getTags():
	return [
		ItemTag.GeneralInmateUniform,
		ItemTag.SoldByMedicalVendomat
		]

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
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityL/Heavy Damage/MaternityUniformL_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityL/Damage/MaternityUniformL_Dam2.tscn",
			}
		if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
			if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformL_both.tscn",}
			if(itemState.isShirtOpened()):
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformL_shirt.tscn",}
			else:
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/Maternity/MaternityUniformL_shorts.tscn",}
		
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityL/Light Damage/MaternityUniformL_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/MaternityL/MaternityUniformL.tscn",
		}
	elif(inmateType == InmateType.HighSec):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityR/Heavy Damage/MaternityUniformR_Dam3.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityR/Damage/MaternityUniformR_Dam2.tscn",
			}
		if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
			if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformR_both.tscn",}
			if(itemState.isShirtOpened()):
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformR_shirt.tscn",}
			else:
				return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/Maternity/MaternityUniformR_shorts.tscn",}
		
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityR/Light Damage/MaternityUniformR_Dam1.tscn",
			}
		return {
			"clothing": "res://Modules/LongUniform/Uniforms/MaternityR/LongUniformR.tscn",
		}
	if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityO/Heavy Damage/MaternityUniformO_Dam3.tscn",
			}
	if(itemState.isDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityO/Damage/MaternityUniformO_Dam2.tscn",
			}
	if(itemState.isShirtOpened() || itemState.areShortsPulledDown()):
		if(itemState.isShirtOpened() && itemState.areShortsPulledDown()):
			return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformO_both.tscn",}
		if(itemState.isShirtOpened()):
			return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUni/LongUniformO_shirt.tscn",}
		else:
			return {"clothing": "res://Modules/ClothingRevamp/MoreUniforms_compatibility/Maternity/MaternityUniformO_shorts.tscn",}
	
	if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Modules/LongUniform/Uniforms/MaternityO/Light Damage/MaternityUniformO_Dam1.tscn",
			}
	return {
		"clothing": "res://Modules/LongUniform/Uniforms/MaternityO/MaternityUniformO.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Modules/LongUniform/ItemIcons/shirtlilac+.png"
	if(inmateType == InmateType.HighSec):
		return "res://Modules/LongUniform/ItemIcons/shirtred+.png"
	return "res://Modules/LongUniform/ItemIcons/shirtorange+.png"
