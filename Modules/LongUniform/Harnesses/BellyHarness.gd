extends ItemBase

func _init():
	id = "bellyharness"

func getVisibleName():
	return "Maternity Harness"
	
#I have no idea what this does
func getA():
	return "a"
	
func getDescription():
	return "A full size harness made to restrict someone's entire torso. Has extra straps designed to squeeze the wearer's stomach area, increasing cum leakage or to emphasize a pregnant belly. (Probably not a good idea if you have inflation/pregnancy size set really high)"

func getClothingSlot():
	return InventorySlot.Torso

#Increase in cum leakage sounds great but idk how to code that
#I checked buffsholder for something like it so nope
#maybe I can use something like the unique biology perk using flared cocks to remove other cum on penetration?
#otherwise im gonna have to edit scripts for things like cum and orifice logic and ngl spending a week learning that, doing it, for a single buff in a clothing mod, isnt worth it because I have so much shit to do
#im gonna just stretch out the wearer's holes and hope by some weird obscure miracle Rahi coded it where stretched holes leak more cum

func getBuffs():
	return [
		buff(Buff.PregnantBellySizeModifierBuff, [10]),
		buff(Buff.GenitalResistanceBuff, [-15]),
		buff(Buff.GenitalElasticityBuff, [10]),
		]

func getPrice():
	return 20

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
		return "straps your body down into the harness"
	else:
		return "strap your body down into the harness"

func getForcedOnMessage(isPlayer = true):
	if(isPlayer):
		return getAStackNameCapitalize()+" was forced onto you. The straps squeeze your body and restrict your movement."
	else:
		return getAStackNameCapitalize()+" was forced onto {receiver.name}. The straps restrict and squeeze {receiver.his}'s body"

func getRiggedParts(_character):
	return {
		"harness": "res://Modules/LongUniform/Harnesses/BellyHarness/BellyHarness.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/GreyRope.png"
