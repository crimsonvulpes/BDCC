# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Bella"

func _init():
	id = "clib_snugglefox22__bella"

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

	pickedSkin = "LayeredSkin"
	pickedSkinRColor = Color("ffffffff")
	pickedSkinGColor = Color("fffa9ec3")
	pickedSkinBColor = Color("fffa9ec3")
	npcSkinData={'anus': {}, 'arms': {'r': Color("fffa9ec3"), 'skin': 'EmptySkin'}, 'body': {}, 'breasts': {}, 'ears': {'b': Color("ffb3a8ab"), 'g': Color("fffdeef3"), 'r': Color("fffa9ec3")}, 'hair': {'b': Color("ffc480a1"), 'g': Color("ffc480a1"), 'r': Color("fffca4ce")}, 'head': {'b': Color("ffffffff"), 'g': Color("ffffffff"), 'r': Color("fffa9ec3")}, 'legs': {}, 'penis': {'b': Color("fffec2dc"), 'g': Color("ffe6d8dc"), 'r': Color("fffcedf2"), 'skin': 'Gradientcanine'}, 'tail': {'b': Color("ffe3d5da"), 'g': Color("fffdeef3"), 'r': Color("fffa9ec3"), 'skin': 'CunningSkin'}, 'vagina': {}}

func getGender():
	return Gender.Male

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['fox']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 100

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	
	var breasts = GlobalRegistry.createBodypart("fluffbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("furfauxfoxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22.5
	penis.ballsScale = 0.8
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'inmateuniform'}, {'data': {}, 'id': 'inmatecollar'}]
