extends ItemBase

func _init():
	id = "restrictharness"

func getVisibleName():
	return "Retriction Harness"
	
#I have no idea what this does
func getA():
	return "a"
	
func getDescription():
	return "A full size body harness with extra straps to really rip up someone. Also helps with tucking in or compressing various parts."

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [35]),
		buff(Buff.BreastsMilkProductionBuff, [-15]),
		buff(Buff.BreastsLactatingSizeLimitBuff, [-1]),
		buff(Buff.GenitalElasticityBuff, [-15]),
		buff(Buff.GenitalResistanceBuff, [10]),
		buff(Buff.PregnantBellySizeModifierBuff, [-15]),
		buff(Buff.ExposureBuff, [25]),
		]

func getPrice():
	return 35

func canSell():
	return true

#Unsure to make it full BDSM restraint, as defined by the game
#doesnt directly restrict the player, or engage with them sexually like the ropes rubbing a characters crotch
#but BDSM isnt on my fetish list so who knows
func getTags():
	return [ItemTag.BDSMRestraint, ItemTag.CanBeForcedByGuards, ItemTag.CanBeForcedInStocks, ItemTag.SoldByTheAnnouncer]

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintRopeHarness.new()
	restraintData.setLevel(calculateBestRestraintLevel())

func getTakingOffStringLong(withS):
	if(withS):
		return "unbuckles and wiggles out of your harness"
	else:
		return "unbuckle and wiggle out of your harness"

func getPuttingOnStringLong(withS):
	if(withS):
		return "straps your body into the harness"
	else:
		return "strap your body into the harness"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced onto you. The straps cling to your body and make you look a bit sexier."
	else:
		return getAStackNameCapitalize()+" was forced onto {receiver.name}. The straps cling to your body and make {receiver.his} look a bit sexier."

func getRiggedParts(_character):
	return {
		"harness": "res://Modules/LongUniform/Harnesses/RestrictionHarness/RestrictionHarness.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/GreyRope.png"
