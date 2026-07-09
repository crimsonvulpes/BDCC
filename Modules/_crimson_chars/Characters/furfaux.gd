# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Fur Faux"

func _init():
	id = "clib_furfaux"

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

	pickedSkin = "RayFauxSkin"
	pickedSkinRColor = Color("fffffffe")
	pickedSkinGColor = Color("ff8aafc3")
	pickedSkinBColor = Color("ffef9d4f")
	npcSkinData={'anus': {}, 'arms': {}, 'body': {}, 'breasts': {}, 'ears': {'b': Color("ffffffff")}, 'hair': {'b': Color("ff4e6e85"), 'g': Color("ff2d4352"), 'r': Color("ff8aafc4")}, 'head': {}, 'legs': {}, 'penis': {'b': Color("ffed99ae"), 'g': Color("ffed99ae"), 'r': Color("ffab5369")}, 'tail': {}}

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
	breasts.size = -1
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("furfauxears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("furfauxfoxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	# intersexcaninepenis
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'inmatecollar'}]
