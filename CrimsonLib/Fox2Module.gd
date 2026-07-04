#extends Module
extends "res://FoxLib/FoxModule.gd"
class_name Fox2Module

# You modify these, depending what you need to be logged that's missing.
var log_missing = {
	"skins": false,
	"characters": true,
	"scenes": true,
	"items": false,
	"events": false,
	"quests": false,

	"bodyparts": false,
	"species": false,
	"worldEdits": false,
	
	"sexGoals": false,
	"sexActivities": false,
	"sexTypes": false,
	
	"attacks": false,
	"skills": false,
	"perks": false,
	"lustActions": false,
	"buffs": false,
	"statusEffects": false,
	"gameExtenders": false,
	"computers": false,
	"partSkins": false,
	"stageScenes": false,
	"lootTables": false,
	"lootLists": false,
	"fetishes": false,
	"fluids": false,
	"speechModifiers": false,

	"slaveBreakTasks": false,
	"slaveTypes": false,
	"slaveActions": false,
	"slaveEvents": false,
	"slaveActivities": false
	
	
	#"": false,
}

var path = ""
var skins:Array = []


func _setLog(what:String, new_value:bool):
	what = what.to_lower()
	if what == "skins":
		log_missing["skins"] = new_value
	elif what == "characters":
		log_missing["characters"] = new_value
	elif what == "scenes":
		log_missing["scenes"] = new_value
	elif what == "items":
		log_missing["items"] = new_value
	elif what == "events":
		log_missing["events"] = new_value
	elif what == "quests":
		log_missing["quests"] = new_value
	elif what == "bodyparts":
		log_missing["bodyparts"] = new_value
	elif what == "species":
		log_missing["species"] = new_value
	elif what == "worldedits" or what == "world_edits":
		log_missing["worldEdits"] = new_value
	elif what == "sexgoals" or what == "sex_goals":
		log_missing["sexGoals"] = new_value
	elif what == "sexactivities" or what == "sex_activities":
		log_missing["sexActivities"] = new_value
	elif what == "sextypes" or what == "sex_types":
		log_missing["sexTypes"] = new_value
	elif what == "attacks":
		log_missing["attacks"] = new_value
	elif what == "skins":
		log_missing["skills"] = new_value
	elif what == "perks":
		log_missing["perks"] = new_value
	elif what == "lustactions" or what == "lust_actions":
		log_missing["lustActions"] = new_value
	elif what == "buffs":
		log_missing["buffs"] = new_value
	elif what == "statuseffects" or what == "status_effects":
		log_missing["statusEffects"] = new_value
	elif what == "gameextenders" or what == "game_extenders":
		log_missing["gameExtenders"] = new_value
	elif what == "computers":
		log_missing["computers"] = new_value
	elif what == "partskins" or what == "part_sknis":
		log_missing["partSkins"] = new_value
	elif what == "stagescenes" or what == "stage_scenes":
		log_missing["stageScenes"] = new_value
	elif what == "loottables" or what == "loot_tables":
		log_missing["lootTables"] = new_value
	elif what == "lootlists" or what == "loot_lists":
		log_missing["lootLists"] = new_value
	elif what == "fetishes":
		log_missing["fetishes"] = new_value
	elif what == "fluids":
		log_missing["fluids"] = new_value
	elif what == "speechmodifiers" or what == "speech_modifiers":
		log_missing["speechModifiers"] = new_value
	elif what == "slavebreaktasks" or what == "slave_breaktasks":
		log_missing["slaveBreakTasks"] = new_value
	elif what == "slavetypes" or what == "slave_types":
		log_missing["slaveTypes"] = new_value
	elif what == "slaveactions" or what == "slave_actions":
		log_missing["slaveActions "]= new_value
	elif what == "slaveevents" or what == "slave_events":
		log_missing["slaveEvents"] = new_value
	elif what == "slaveactivities" or what == "slave_activities":
		log_missing["slaveActivities"] = new_value

func _registerDirs():
	skins = FoxyBusiness.get_files(true, log_missing['skins'], _getPath("Skins"))
	
	characters = FoxyBusiness.get_files(true, log_missing['characters'], _getPath("Characters"))
	scenes = FoxyBusiness.get_files(true, log_missing['scenes'], _getPath("Scenes"))
	items = FoxyBusiness.get_files(true, log_missing['items'], _getPath("Items"))
	events = FoxyBusiness.get_files(true, log_missing['events'], _getPath("Events"))
	quests = FoxyBusiness.get_files(true, log_missing['quests'], _getPath("Quests"))
		
	bodyparts = FoxyBusiness.get_files(true, log_missing['bodyparts'], _getPath("Bodyparts"))
	species = FoxyBusiness.get_files(true, log_missing['species'], _getPath("Species"))
	worldEdits = FoxyBusiness.get_files(true, log_missing['worldEdits'], _getPath("WorldEdits"))
		
	sexGoals = FoxyBusiness.get_files(true, log_missing['sexGoals'], _getPath("Sex/Goals"))
	sexActivities = FoxyBusiness.get_files(true, log_missing['sexActivities'], _getPath("Sex/Activities"))
	sexTypes = FoxyBusiness.get_files(true, log_missing['sexTypes'], _getPath("Sex/Types"))
		
	attacks = FoxyBusiness.get_files(true, log_missing['attacks'], _getPath("Attacks"))
	skills = FoxyBusiness.get_files(true, log_missing['skills'], _getPath("Skims"))
	perks = FoxyBusiness.get_files(true, log_missing['perks'], _getPath("Perks"))
	lustActions = FoxyBusiness.get_files(true, log_missing['lustActions'], _getPath("LustActions"))
	buffs = FoxyBusiness.get_files(true, log_missing['buffs'], _getPath("Buffs"))
	statusEffects = FoxyBusiness.get_files(true, log_missing['statusEffects'], _getPath("StatusEffects"))
	gameExtenders = FoxyBusiness.get_files(true, log_missing['gameExtenders'], _getPath("GameExtenders"))
	computers = FoxyBusiness.get_files(true, log_missing['computers'], _getPath("Computers"))
	partSkins = FoxyBusiness.get_files(true, log_missing['partSkins'], _getPath("Partskins"))
	stageScenes = FoxyBusiness.get_files(true, log_missing['stageScenes'], _getPath("StageScenes"))
	lootTables = FoxyBusiness.get_files(true, log_missing['lootTables'], _getPath("LootTables"))
	lootLists = FoxyBusiness.get_files(true, log_missing['lootLists'], _getPath("LootLists"))
	fetishes = FoxyBusiness.get_files(true, log_missing['fetishes'], _getPath("Fetishes"))
		
	fluids = FoxyBusiness.get_files(true, log_missing['fluids'], _getPath("Fluids"))
	speechModifiers = FoxyBusiness.get_files(true, log_missing['speechModifiers'], _getPath("SpeechModifiers"))
		
	slaveBreakTasks = FoxyBusiness.get_files(true, log_missing['slaveBreakTasks'], _getPath("Slave/BreakTasks"))
	slaveTypes = FoxyBusiness.get_files(true, log_missing['slaveTypes'], _getPath("Slave/Types"))
	slaveActions = FoxyBusiness.get_files(true, log_missing['slaveActions'], _getPath("Slave/Actions"))
	slaveEvents = FoxyBusiness.get_files(true, log_missing['slaveEvents'], _getPath("Slave/Events"))
	slaveActivities = FoxyBusiness.get_files(true, log_missing['slaveActivities'], _getPath("Slave/Activities"))
	
	for skin in skins:
		GlobalRegistry.registerSkin(skin)
	


func _getPath(sub) -> String:
	# res://Modules/whatever
	return path + "/" + sub

func setPath(_new_path: String):
	path = _new_path

func register():
	_registerDirs()
	.register()
	
