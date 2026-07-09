# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "purpfox"

func _init():
	id = "clib_purpfox"

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

	pickedSkin = "CunningSkin"
	pickedSkinRColor = Color("990099")
	pickedSkinGColor = Color("D3D3D3")
	pickedSkinBColor = Color("990099")
	npcSkinData={
			"hair": {"r": Color("967bb6"),"g": Color("967bb6"),"b": Color("967bb6"),},
			"arms": {"g": Color("4D004D"),},
			"legs": {"g": Color("4D004D"),},
		}

func getGender():
	return Gender.Male

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
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears2tribal"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	# intersexcaninepenis
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 0.5
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
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
