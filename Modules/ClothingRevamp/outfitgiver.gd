extends ItemBase

func _init():
	id = "outfitgiver"

func getVisibleName():
	return "Outfit Giver (debug)"
	
func getDescription():
	return "debug item"

func canUseInCombat():
	return true

func useInCombat(_attacker, _receiver):
#	removeXOrDestroy(1)

	var pockets = _attacker.getInventory()
	pockets.addItemID("inmateuniform")
	pockets.addItemID("inmateuniformHighsec")
	pockets.addItemID("inmateuniformSexDeviant")
	pockets.addItemID("croptopuniform")
	pockets.addItemID("croptopred")
	pockets.addItemID("croptoplilac")
	pockets.addItemID("inmateuniformlong")
	pockets.addItemID("inmateuniformlong-L")
	pockets.addItemID("inmateuniformlong-R")
	pockets.addItemID("maternityuniform")
	pockets.addItemID("maternityuniform-L")
	pockets.addItemID("maternityuniform-R")
	pockets.addItemID("LaceBra")
	pockets.addItemID("LacePanties")
	pockets.addItemID("plainBra")
	pockets.addItemID("plainBriefs")
	pockets.addItemID("plainPanties")
	pockets.addItemID("plainUndershirt")
	pockets.addItemID("sportyBriefs")
	pockets.addItemID("sportyTankTop")
	pockets.addItemID("sportyTop")
	
	return "done"
	
	
			
func getPossibleActions():
	return [
		{
			"name": "Use",
			"scene": "UseItemLikeInCombatScene",
			"description": "Use the device",
		},
	]

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return false

func getTags():
	return [
		ItemTag.SoldByGeneralVendomat
		]

func getBuyAmount():
	return 1

func getItemCategory():
	return ItemCategory.Generic

func getInventoryImage():
	return  "res://Modules/ClothingRevamp/ItemIcons/skirtlong.png"
