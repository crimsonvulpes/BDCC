# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Artica"

func _init():
	id = "clib_artica"

	## Optional
	# npcLevel = 10
	# npcBasePain = 150
	# npcBaseLust = 250
	# npcBaseStamina = 150

	npcCharacterType = CharacterType.Inmate
	# Types:
	#  CharacterType.Generic
	#  CharacterType.Inmate
	#  CharacterType.Guard
	#  CharacterType.Nurse
	#  CharacterType.Engineer
	###

	pickedSkin="ArticSkin"
	pickedSkinRColor=Color("ffffffff")
	pickedSkinGColor=Color("ff15eff2")
	pickedSkinBColor=Color("ff009b93")
	npcSkinData={
	"hair": {"r": Color("ffffffff"),"g": Color("ff15eff2"),"b": Color("ff009b93"),},
	"ears": {"b": Color("ff646464"),},
	"penis": {"r": Color("fff6f6f6"),"g": Color("ff15eff2"),"b": Color("ff009b93"),},
	}

func getGender():
	return Gender.Female

func getSmallDescription() -> String:
	return "Shy lilac that has a very bright white fur"

func getSpecies():
	return ["icejogauni"]

func getChatColor():
	return '#ff15eff2'

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears2tribal"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func updateBodyparts():
	var shouldHaveNoCatcher = (GM.main != null && GM.main.getFlag("ArticaModule.articaLostDreamcatcher", false) && !GM.main.getFlag("ArticaModule.LQArticaGotDreamCatcher", false))
	
	if(shouldHaveNoCatcher):
		giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears2"))
	else:
		giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears2tribal"))
		
	var isCurvy = (GM.main != null && GM.main.getFlag("ArticaModule.CurvyForm", false))
	if(isCurvy):
		var penis = getBodypart(BodypartSlot.Penis)
		if(penis != null):
			penis.lengthCM = 26
		var breasts = getBodypart(BodypartSlot.Breasts)
		if(breasts != null):
			breasts.size = 6

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
