extends ItemBase

func _init():
	id = "maxharness"

func getVisibleName():
	return "Sexy Harness"
	
#I have no idea what this does
func getA():
	return "a"
	
func getDescription():
	return "A full size harness made to look sexy. This one is of a different design, looking more fit for roleplay than BDSM. (Drawn by MaxMaxou)"

func getClothingSlot():
	return InventorySlot.Torso

func getBuffs():
	return [
		buff(Buff.AmbientLustBuff, [30]),
		buff(Buff.LustDamageBuff, [10]),
		]

func getPrice():
	return 25

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
		"harness": "res://Modules/LongUniform/Harnesses/MaxHarness/MaxHarness.tscn",
	}

func getInventoryImage():
	return "res://Modules/LongUniform/ItemIcons/GreyRope.png"
