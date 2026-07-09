# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Bluey"

func _init():
	id = "clib_bluey"

	## Optional
	# npcLevel = 10
	# npcBasePain = 150
	# npcBaseLust = 250
	# npcBaseStamina = 150

	npcCharacterType = CharacterType.Generic
	# Types:
	#  CharacterType.Generic
	#  CharacterType.Inmate
	#  CharacterType.Guard
	#  CharacterType.Nurse
	#  CharacterType.Engineer
	###

	pickedSkin = "FerriSkin"
	pickedSkinRColor = Color("ffcbfffa")
	pickedSkinGColor = Color("ffffffff")
	pickedSkinBColor = Color("ff8afff6")
	npcSkinData={'anus': {}, 'arms': {'g': Color("ff4c7e7f"), 'skin': 'bluey_segaaidan_skin'}, 'body': {}, 'breasts': {}, 'ears': {'b': Color("ff3c5859"), 'g': Color("ff2e4747"), 'r': Color("ff486a6b")}, 'hair': {'b': Color("ff2c5f99"), 'g': Color("ff4a85c7"), 'r': Color("ff559be1")}, 'head': {'skin': 'AngledSkin'}, 'legs': {'g': Color("ff4c7e7f"), 'skin': 'bluey_segaaidan_skin'}, 'penis': {'b': Color("ff4de6ca"), 'g': Color("ff4de6ca"), 'r': Color("fff9f9f9")}, 'tail': {'g': Color("ffcbfffa"), 'r': Color("ffffffff"), 'skin': 'EmptySkin'}}

func getGender():
	return Gender.Male

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['arctic_fox']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	
	var breasts = GlobalRegistry.createBodypart("fluffmalebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("furfauxfoxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.8
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("bluey_segaaidan_tail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'inmatecollar'}]
