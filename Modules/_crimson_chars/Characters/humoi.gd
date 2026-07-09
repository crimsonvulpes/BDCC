# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
	# Change me as needed!
	return "Humoi"

func _init():
	id = "clib_humoi"

	## Optional
	npcLevel = 7
	npcBasePain = 80
	npcBaseLust = 80
	npcCharacterType = CharacterType.Inmate
	

	npcPersonality = {
		PersonalityStat.Brat: -1.0,
		PersonalityStat.Mean: -0.8,
		PersonalityStat.Subby: 1.0,
		PersonalityStat.Impatient: -0.6,
		PersonalityStat.Naive: -0.8,
		PersonalityStat.Coward: -0.8,
	}
	
	npcFetishes = {
		Fetish.AnalSexReceiving : FetishInterest.SlightlyLikes,
		Fetish.AnalSexGiving : FetishInterest.Neutral,
		Fetish.VaginalSexGiving : FetishInterest.Likes,
		Fetish.OralSexReceiving : FetishInterest.Likes,
		Fetish.OralSexGiving : FetishInterest.Likes,
		Fetish.Sadism : FetishInterest.SlightlyLikes,
		Fetish.Masochism : FetishInterest.Likes,
		Fetish.UnconsciousSex : FetishInterest.Hates,
		Fetish.BeingBred : FetishInterest.Likes,
		Fetish.Bondage : FetishInterest.Neutral,
		Fetish.Condoms : FetishInterest.Neutral,
		Fetish.DrugUse : FetishInterest.Loves,
		Fetish.Exhibitionism : FetishInterest.SlightlyLikes,
		Fetish.HypnosisHypnotist : FetishInterest.SlightlyLikes,
		Fetish.HypnosisSubject : FetishInterest.SlightlyLikes
	}

	npcCharacterType = CharacterType.Generic
	# Types:
	#  CharacterType.Generic
	#  CharacterType.Inmate
	#  CharacterType.Guard
	#  CharacterType.Nurse
	#  CharacterType.Engineer
	###

    
	npcLustInterests = {
		InterestTopic.TallyMarks: Interest.ReallyLikes,
		InterestTopic.Bodywritings: Interest.Loves,
		InterestTopic.FeminineBody: Interest.Likes,
		InterestTopic.AndroBody: Interest.Likes,
		InterestTopic.MasculineBody: Interest.Neutral,
		InterestTopic.ThickBody: Interest.Likes,
		InterestTopic.SlimBody: Interest.KindaLikes,
		InterestTopic.MediumBreasts: Interest.Likes,
		InterestTopic.BigBreasts: Interest.ReallyLikes,
		InterestTopic.LactatingBreasts: Interest.KindaLikes,
		InterestTopic.StuffedPussy: Interest.Neutral,
		InterestTopic.Pregnant: Interest.Neutral,
		InterestTopic.StuffedThroat: Interest.KindaLikes,
		InterestTopic.CoveredInCum: Interest.Likes,
		InterestTopic.CoveredInLotsOfCum: Interest.KindaLikes,
		InterestTopic.FullyNaked: Interest.ReallyLikes,
		InterestTopic.ExposedPussy: Interest.Likes,
		InterestTopic.ExposedAnus: Interest.KindaLikes,
		InterestTopic.ExposedBreasts: Interest.Likes,
		InterestTopic.ExposedCock: Interest.Likes,
		InterestTopic.ExposedPanties: Interest.SlightlyDislikes,
		InterestTopic.ExposedBra: Interest.SlightlyDislikes,
		InterestTopic.LooseAnus: Interest.SlightlyDislikes,
		InterestTopic.LoosePussy: Interest.SlightlyDislikes,
		InterestTopic.TightAnus: Interest.KindaLikes,
		InterestTopic.TightPussy: Interest.KindaLikes,
		InterestTopic.NoVagina: Interest.Dislikes,
		InterestTopic.HasVaginaOnly: Interest.Neutral,
		InterestTopic.HasVaginaAndCock: Interest.ReallyLikes,
		InterestTopic.BigCock: Interest.Likes,
		InterestTopic.AverageCock: Interest.ReallyLikes,
		InterestTopic.SmallCock: Interest.Likes,
		InterestTopic.NoCock: Interest.Neutral,
		InterestTopic.HasCockOnly: Interest.Dislikes,
	}

	pickedSkin = "MonsterGirl"
	pickedSkinRColor = Color("ffffffff")
	pickedSkinGColor = Color("ff227f81")
	pickedSkinBColor = Color("ff43e0ec")
	npcSkinData={
			"head": {"skin": "EmptySkin","g": Color("ff0d0909"),"b": Color("ff8a6161"),},
			"tail": {"skin": "CyberneticSkin","b": Color("ffb24695"),},
        }

func getGender():
	return Gender.Androgynous

func getSmallDescription() -> String:
	return "A lilac fluffy dragon inmate. Holding a datapad for some reason."

func getSpecies():
	return ["icejogauni"]

func getChatColor():
	return '#43e0ec'

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 85

func createBodyparts():
	# EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anuswomb"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 10
	giveBodypartUnlessSame(breasts)

	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhorns"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("dragonhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	
	# intersexcaninepenis
	var penis = GlobalRegistry.createBodypart("dragonpenis")
	penis.lengthCM = 28
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)

	var tail = GlobalRegistry.createBodypart("dragontail")
	tail.tailScale = 1.1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	
func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
