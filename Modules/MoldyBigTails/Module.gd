extends Module
class_name MouthModule

func _init():
	id = "MoldyMouthTailModule"
	author = "MoldyT"
	
	bodyparts = [
		"res://Modules/MoldyBigTails/Files/MouthTail1/MouthTail1.gd",
		"res://Modules/MoldyBigTails/Files/MouthTail2/MouthTail2.gd",

		"res://Modules/MoldyBigTails/Files/PuffyWolfTail/PuffyWolfTail.gd",
		"res://Modules/MoldyBigTails/Files/FeralWolfTail/FeralWolfTail.gd",

		"res://Modules/MoldyBigTails/Files/SLeopardTail/SLeopardTail.gd",
		"res://Modules/MoldyBigTails/Files/FluffLeopardTail/FluffLeopardTail.gd"
	]
	
	partSkins = [
#                           --- Mouth Tails ---
		#Tail Pattern 1
		"res://Modules/MoldyBigTails/Files/MouthTail1/MouthTail1P1E.gd",
		"res://Modules/MoldyBigTails/Files/MouthTail1/MouthTail1P2.gd",
		"res://Modules/MoldyBigTails/Files/MouthTail1/MouthTail1P2E.gd",
		#Tail Pattern 2
		"res://Modules/MoldyBigTails/Files/MouthTail2/MouthTail2P1E.gd",
		"res://Modules/MoldyBigTails/Files/MouthTail2/MouthTail2P2.gd",
		"res://Modules/MoldyBigTails/Files/MouthTail2/MouthTail2P2E.gd",

#                           --- Canine Tails ---
		#Puffy Wolf Tail
		"res://Modules/MoldyBigTails/Files/PuffyWolfTail/PuffyWolfPattern2.gd",
		"res://Modules/MoldyBigTails/Files/PuffyWolfTail/PuffyWolfPattern3.gd",
		#Feral Wolf Tail
		"res://Modules/MoldyBigTails/Files/FeralWolfTail/FeralWolfPattern2.gd",

#                           --- Feline Tails ---
		#Snow Leopard Tail
		"res://Modules/MoldyBigTails/Files/SLeopardTail/SLeopardPattern2.gd",
		"res://Modules/MoldyBigTails/Files/SLeopardTail/SLeopardPattern3.gd",
		#Fluffy Leopard Tail
		"res://Modules/MoldyBigTails/Files/FluffLeopardTail/FluffLeopardPattern2.gd",
		"res://Modules/MoldyBigTails/Files/FluffLeopardTail/FluffLeopardPattern3.gd"
	]
