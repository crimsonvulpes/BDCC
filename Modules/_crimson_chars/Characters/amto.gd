# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Amto"

func _init():
	id = "clib_amto"

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

	pickedSkin = "AmtoSkin"
	pickedSkinRColor = Color("ffd1aeac")
	pickedSkinGColor = Color("fffcf5ed")
	pickedSkinBColor = Color("ffa07d79")
	npcSkinData={'anus': {}, 'arms': {'skin': 'SocketSkin'}, 'body': {}, 'breasts': {'b': Color("ffd1aeac"), 'g': Color("fff67263"), 'r': Color("ffd1aeac"), 'skin': 'ArticSkin'}, 'ears': {'g': Color("ffccaeac"), 'r': Color("ffd1aeac"), 'skin': 'amtoearsskin'}, 'hair': {'b': Color("ffb69896"), 'g': Color("ffb69896"), 'r': Color("ff977e7a"), 'skin': 'longhairindustrial'}, 'head': {}, 'legs': {'skin': 'AmtoSkin'}, 'tail': {}, 'vagina': {}}

func getGender():
	return Gender.Male

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['feline']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	
	var breasts = GlobalRegistry.createBodypart("fluffbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	var tail = GlobalRegistry.createBodypart("puffywolftail")
	tail.tailScale = 0.8
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return []
