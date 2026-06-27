extends ItemBase

func _init():
	id = "chestwraps"

func getVisibleName():
	return "Chest Wraps"
	
func getDescription():
	var text = "Some cloth wrap. This one seems like its made to wrap around someone's chest."

	return text

func getClothingSlot():
	return InventorySlot.UnderwearTop

func getBuffs():
	return []

func getTakingOffStringLong(withS):
	if(withS):
		return "strips off the wrappings on your chest"
	else:
		return "strip off the wrappings on your chest"

func getPuttingOnStringLong(withS):
	if(withS):
		return "grabs some cloth and wraps up your chest"
	else:
		return "grab some cloth and wrap up your chest"

func getPrice():
	return 3

func getTags():
	return [
		ItemTag.SoldByMedicalVendomat,
		ItemTag.GeneralInmateUniform
		]


func generateItemState():
	itemState = BraState.new()
	itemState.canActuallyBeDamaged = true

func getRiggedParts(_character):
	if(itemState.isRemoved() || itemState.isBraPulledUp()):
		return null
		

#Super damage and half damage dont exist on bras RIP

#	if(itemState.isSuperDamaged()):
#		return {
#			"bra": "res://Modules/LongUniform/ChestWraps/Heavy Damage/ChestWraps_Dam3.tscn",
#		}
	if(itemState.isDamaged()):
		return {
			"bra": "res://Modules/LongUniform/Misc Clothes/ChestWraps/Heavy Damage/ChestWraps_Dam3.tscn",
		}
#	if(itemState.isHalfDamaged()):
#		return {
#			"bra": "res://Modules/LongUniform/ChestWraps/Light Damage/ChestWraps_Dam1.tscn",
#		}
	
	return {
		"bra": "res://Modules/LongUniform/Misc Clothes/ChestWraps/ChestWraps.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/WrapsIcon.png"

func canDye():
	return true
