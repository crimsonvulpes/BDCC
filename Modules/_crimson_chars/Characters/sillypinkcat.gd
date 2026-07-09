# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Pink Cat"

func _init():
	id = "clib_pinkcat"

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
	pickedSkinRColor = Color("ffffcefd")
	pickedSkinGColor = Color("fffefefe")
	pickedSkinBColor = Color("ffdbdbdb")
	npcSkinData={'anus': {}, 'arms': {}, 'body': {'skin': 'FerriSkin'}, 'breasts': {}, 'ears': {}, 'head': {'skin': 'AngledSkin'}, 'legs': {}, 'penis': {'b': Color("ffffcefd"), 'g': Color("ffffcefd"), 'r': Color("fff9bef5")}, 'tail': {}, 'vagina': {}}

func getGender():
	return Gender.Other

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['feline']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("fluffbody"))
	
	var breasts = GlobalRegistry.createBodypart("fluffbreasts")
	breasts.size = 1
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("flufflegs"))
	
	# intersexcaninepenis
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("Protofoxtail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return [{'data': {}, 'id': 'bellcollar'}, {'data': {'clothesColor': 'ffffffff'}, 'id': 'pussytape'}]
