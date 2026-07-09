# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Gibibyte"

func _init():
	id = "clib_gibibyte"

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
	pickedSkinRColor = Color("ff8100ff")
	pickedSkinGColor = Color("ff302b2b")
	pickedSkinBColor = Color("ff8100ff")
	npcSkinData={'anus': {}, 'arms': {'b': Color("ff410082"), 'g': Color("ff8100ff"), 'skin': 'protogenskin'}, 'body': {'b': Color("ff47008d"), 'g': Color("ff2b0055"), 'skin': 'protogenskin'}, 'breasts': {'b': Color("ff47008d"), 'g': Color("ff2d0059"), 'r': Color("ff8100ff"), 'skin': 'protogenskin'}, 'ears': {}, 'hair': {'b': Color("ffa9a9a9"), 'g': Color("ffd3d3d3"), 'r': Color("ffffffff")}, 'head': {'skin': 'protogenskin'}, 'legs': {'b': Color("ff47008d"), 'g': Color("ff2b0055"), 'r': Color("ff8100ff"), 'skin': 'protogenskin'}, 'penis': {'b': Color("ff47008d"), 'g': Color("ff8100ff"), 'r': Color("ff2e005c"), 'skin': 'bodymodcanine'}, 'tail': {'b': Color("ff47008d"), 'g': Color("ffffffff"), 'skin': 'protogenskin'}, 'vagina': {}}

func getGender():
	return Gender.Female

# func getSmallDescription() -> String:
#	 return "getSmallDescription"

func getSpecies():
	return ['protogen']

# func getChatColor():
#	return '#FFF60C'

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 100

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("protoarms2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("protobody"))
	
	var breasts = GlobalRegistry.createBodypart("fluffbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ProtoEars"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("baldhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("protogenhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("protolegs2"))
	
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 21
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("Protofoxtail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return [{'data': {'clothesColor': 'ffffffff'}, 'id': 'CasualClothes'}]
