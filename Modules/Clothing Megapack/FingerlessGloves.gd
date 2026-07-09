extends ItemBase

var white

func _init():
	id = "fingerlessgloves"

func getVisibleName():
	if white:
		return "White Fingerles Gloves"
	return "Fingerless Gloves"
	
func getDescription():
	var color = "Black"
	if white:
		color = "White"
	return color + " leather fingerless gloves that go on your hands."

func getClothingSlot():
	return InventorySlot.Hands

func getBuffs():
	return [
		]

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your fingerless gloves"
	else:
		return "takes off your fingerless gloves"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your fingleress gloves"
	else:
		return "puts on your fingleress gloves"

func getPrice():
	return 1

func canSell():
	return true


func getTags():
	return [ItemTag.SoldByUnderwearVendomat]

func updateDoll(doll: Doll3D):
	doll.setState("gloves", "fingerless")

func getRiggedParts(_character):
	if white:
		return {
		"gloves": "res://Modules/Clothing Megapack/WhiteFingerlessGloves/WhiteFingerlessGloves.tscn"
	}
	return {
		"gloves": "res://Modules/Clothing Megapack/FingerlessGloves/FingerlessGloves.tscn"
	}

func getInventoryImage():
	if white:
		return "res://Modules/Clothing Megapack/Icons/White Fingerless Gloves.png"
	return "res://Modules/Clothing Megapack/Icons/Fingerless Gloves.png"
