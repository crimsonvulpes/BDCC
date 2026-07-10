# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "mango"

func _init():
	id = "clib_mango"

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

	pickedSkin = "MangoSkin"
	pickedSkinRColor = Color("ff692e10")
	pickedSkinGColor = Color("ff692e10")
	pickedSkinBColor = Color("fffc8801")
	npcSkinData={'anus': {}, 'arms': {'r': Color("fffc8801")}, 'body': {'g': Color("fffefefe")}, 'breasts': {'g': Color("fffefefe")}, 'ears': {'b': Color("ff20120f"), 'g': Color("ffd9beb7"), 'r': Color("ffffffff"), 'skin': 'mangoearsskin'}, 'hair': {'b': Color("ff1c110e"), 'g': Color("ff140b09"), 'r': Color("ff21120f")}, 'head': {'r': Color("fffefefe")}, 'legs': {'r': Color("fffc8801")}, 'penis': {'b': Color("fffbb1ae"), 'g': Color("ffea9189"), 'r': Color("ffe07800"), 'skin': 'scarredcanine'}, 'tail': {'g': Color("ff2f251b"), 'r': Color("ffffffff"), 'skin': 'MangoSkin'}}

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

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("SongHair9"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.8
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'inmateuniform'}, {'data': {}, 'id': 'inmatecollar'}]
