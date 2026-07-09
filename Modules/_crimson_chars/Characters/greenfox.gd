# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Green Fox"

func _init():
	id = "clib_greenfox"

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

	pickedSkin = "CunningSkin"
	pickedSkinRColor = Color("ffe4efeb")
	pickedSkinGColor = Color("ff408765")
	pickedSkinBColor = Color("ffb2e2ba")
	npcSkinData={'anus': {}, 'arms': {'g': Color("ff1c3b2c")}, 'body': {'skin': 'FerriSkin'}, 'breasts': {'r': Color("ff245639"), 'skin': 'LuxeSkin'}, 'ears': {'b': Color("ff23583a"), 'g': Color("ff418866"), 'r': Color("ff418866")}, 'hair': {'b': Color("ff1a382e"), 'g': Color("ff326b58"), 'r': Color("ff418866")}, 'head': {'b': Color("ff245639"), 'g': Color("ffb2e2ba")}, 'legs': {'b': Color("ff408765"), 'g': Color("ff1c3b2c")}, 'penis': {'b': Color("ff74f599"), 'g': Color("ffb2e2ba"), 'r': Color("ffd4efe0")}, 'tail': {'b': Color("ffe4efeb"), 'g': Color("ffaebecd"), 'r': Color("ffb2e2ba"), 'skin': 'CunningSkin'}, 'vagina': {}}

func getGender():
	return Gender.Female

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['arctic_fox']

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
	breasts.size = 2
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("foxtail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return [{'data': {'clothesColor': 'ffaeffe7'}, 'id': 'Phobos_Striped_Stockings_2'}, {'data': {}, 'id': 'maternityuniform-L'}, {'data': {}, 'id': 'bellcollar'}, {'data': {}, 'id': 'arcticBindings'}, {'data': {'clothesColor': 'ffaeffe7'}, 'id': 'Phobos_Striped_Long_Gloves_2'}]
