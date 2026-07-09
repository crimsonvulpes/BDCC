# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Snowy"

func _init():
	id = "clib_snowy_male"

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

	pickedSkin = "EmptySkin"
	pickedSkinRColor = Color("ffffffff")
	pickedSkinGColor = Color("ffd3d3d3")
	pickedSkinBColor = Color("ffa9a9a9")
	npcSkinData={'penis': {'b': Color("fffafafa"), 'g': Color("ffffffff"), 'r': Color("ffc5c5c5")}, 'arms': {'b': Color("ffffffff"), 'g': Color("ffdbdbdb"), 'r': Color("ffc0c0c0"), 'skin': 'LayeredSkin'}, 'body': {'b': Color("ffc0c0c0"), 'g': Color("ffc0c0c0"), 'r': Color("ffffffff"), 'skin': 'FurGirl'}, 'breasts': {'b': Color("ffababab"), 'g': Color("ffffffff"), 'r': Color("ffe6e6e6"), 'skin': 'FurGirl'}, 'ears': {'b': Color("ffc0c0c0"), 'g': Color("ffffffff"), 'r': Color("ffc0c0c0"), 'skin': 'wolfearscolorinverted'}, 'hair': {'b': Color("ffa9a9a9"), 'g': Color("ffd3d3d3"), 'r': Color("ffffffff")}, 'head': {'b': Color("ffc0c0c0"), 'g': Color("ffc0c0c0"), 'r': Color("ffffffff"), 'skin': 'ArticSkin'}, 'legs': {'b': Color("ffc0c0c0"), 'g': Color("ffdbdbdb"), 'r': Color("ffdbdbdb"), 'skin': 'FurGirl'}, 'tail': {'b': Color("ffd8d8d8"), 'g': Color("ff515151"), 'skin': 'EmptySkin'}, 'vagina': {}}

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
	return 100

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)
	var tail = GlobalRegistry.createBodypart("snowy_tail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	
func getDefaultEquipment():
	return [{'data': {'clothesColor': 'ffaeffe7'}, 'id': 'Phobos_Striped_Stockings_2'}, {'data': {}, 'id': 'maternityuniform-L'}, {'data': {}, 'id': 'bellcollar'}, {'data': {}, 'id': 'arcticBindings'}, {'data': {'clothesColor': 'ffaeffe7'}, 'id': 'Phobos_Striped_Long_Gloves_2'}]
