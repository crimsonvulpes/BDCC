extends ItemBase

func _init():
	id = "arcticBindings"

func getVisibleName():
	return "Arctic Bindings"
	
func getDescription():
	return "A set of expertly knotted ropes, designed for both restraint and aesthetics. The white and gray weave blends into Snowy's fur, but its strength is undeniable."

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [20]),
		buff(Buff.StatBuff, [Stat.Sexiness, 8]),
	]

func getPrice():
	return 20

func canSell():
	return true

func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedInStocks]
	# return [ItemTag.BDSMRestraint, ItemTag.SoldByTheAnnouncer, ItemTag.CanBeForcedInStocks]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintRopeHarness.new()
	restraintData.setLevel(5)

func getTakingOffStringLong(withS):
	if(withS):
		return "breaks locks and removes your harness"
	else:
		return "breaks locks and remove your harness"

func getPuttingOnStringLong(withS):
	if(withS):
		return "ties your body up with leather belts"
	else:
		return "tie your body up with leather belts"

func getRiggedParts(_character):
	return {
		"harnessHR1": "res://Modules/CrimsonLib/Items/Models/Harness.tscn",
	}

	
#func getChains():
#	if(isWornByWearer()):
#		getWearer().getInventory().hasItemIDEquipped("???")
#		if(isWornByWearer()):
#			if(getWearer().getInventory().hasItemIDEquipped("leatheranklecuffs")):
#				return [["short", "spineR", "ankle.R"], ["short", "spineL", "ankle.L"]]
#			if(getWearer().getInventory().hasItemIDEquipped("leatheranklecuffs")):
#				return [["short", "spineR", "wrist.R"], ["short", "spineL", "wrist"]]
	
func getItemCategory():
	return "CrimsonLib"

func getInventoryImage():
	return "res://Modules/CrimsonLib/Items/Textures/arctic_harness_Hr.png"
