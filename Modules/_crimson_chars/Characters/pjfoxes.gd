# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "pjfoxes"

func _init():
	id = "clib_pjfoxes"

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

	pickedSkin = "bluey_segaaidan_skin"
	pickedSkinRColor = Color("ffffb3f1")
	pickedSkinGColor = Color("fffffbf2")
	pickedSkinBColor = Color("fffffbf2")
	npcSkinData={'anus': {}, 'arms': {'g': Color("ff6b5965")}, 'body': {'skin': 'FerriSkin'}, 'breasts': {'r': Color("fffffbf2")}, 'ears': {'r': Color("ffffffff")}, 'hair': {'b': Color("ffa9a9a9"), 'g': Color("ffd3d3d3"), 'r': Color("ffffffff")}, 'head': {'b': Color("ffffb3f1"), 'g': Color("ff53242a"), 'r': Color("fffffbf2"), 'skin': 'pjfox'}, 'legs': {'g': Color("ff6b5965")}, 'penis': {'b': Color("ffffa0a1"), 'g': Color("ffff6160"), 'r': Color("fffffef5"), 'skin': 'Weiny'}, 'tail': {'g': Color("ff432f31"), 'skin': 'pjfoxtail'}}

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
	return 0

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("pjfoxears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ariwolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("puffywolftail")
	tail.tailScale = 0.8
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {'clothesColor': 'ffffffff'}, 'id': 'pjfox_thighighs'}, {'data': {}, 'id': 'pjfoxhoodie'}, {'data': {'clothesColor': 'ffb1e4ff'}, 'id': 'LacePanties'}]
