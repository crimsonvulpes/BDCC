extends ItemBase

func _init():
	id = "6strapharness"

func getVisibleName():
	return "6-Point Harness"
	
#I have no idea what this does
func getA():
	return "a"
	
func getDescription():
	return "A set of 6 main straps designed around binding around your upper torso."

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [10]),
		buff(Buff.StatBuff, [Stat.Sexiness, 2]),
		]

func getPrice():
	return 12

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
		"harness": "res://Modules/LongUniform/Harnesses/6PointHarness/6PointHarness.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/GreyRope.png"
