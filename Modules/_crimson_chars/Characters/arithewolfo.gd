# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Ari The Wolfo"

func _init():
	id = "clib_ari_the_wolfo"

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

	pickedSkin = "AriWolfSkin"
	pickedSkinRColor = Color("ff98989a")
	pickedSkinGColor = Color("ffd3d3d3")
	pickedSkinBColor = Color("ff414141")
	npcSkinData={'anus': {}, 'arms': {'g': Color("ff5f5f5f"), 'r': Color("ff5f5f5f"), 'skin': 'RayFauxSkin'}, 'body': {}, 'breasts': {}, 'ears': {'b': Color("ffa6a6a6"), 'g': Color("fffffeff"), 'r': Color("ff414141")}, 'hair': {'b': Color("ffa9a9a9"), 'g': Color("ffd3d3d3"), 'r': Color("ffffffff")}, 'head': {'g': Color("ff21efa7"), 'skin': 'AriWolfSkin'}, 'legs': {'g': Color("ff5f5f5f"), 'r': Color("ff948f8c"), 'skin': 'RayFauxSkin'}, 'penis': {'b': Color("fff2808a"), 'g': Color("fff2808a"), 'r': Color("fffbfff7")}, 'tail': {'g': Color("ffffffff"), 'r': Color("ff1ff1aa"), 'skin': 'AriWolfSkin'}}

func getGender():
	return Gender.Male

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['canine']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ariwolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("halfflufflegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1.3
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'inmateuniform'}, {'data': {}, 'id': 'inmatecollar'}]
