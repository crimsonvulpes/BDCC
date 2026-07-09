# this is mainly for personal use for me

extends Object
class_name FoxyBusiness

const other_config = "user://crimsonvulpes/other_config.json"

#OTHER
const defaultJson = {
	"likedChars": [
		"alexrynard",
		"purpfox"
	]
}

static func getValue(dict, entry, _default):
	if dict.has(entry):
		return dict.get(entry)
	return _default

static func doesPlayerHaveRestraintsOn():
	var player = GM.pc
	
	if player.inventory.getEquippedRestraints().size() > 0:
		return true
	return false

static func getPlayerRestraints():
	var player = GM.pc
	
	if doesPlayerHaveRestraintsOn():
		return player.inventory.getEquippedRestraints()
	return []

static func removeRestraint(restraint):
	var player = GM.pc
	
	if doesPlayerHaveRestraintsOn():
		player.inventory.unequipItem(restraint)
	pass

static func removeRestraints():
	var player = GM.pc
	
	if doesPlayerHaveRestraintsOn():
		for item in getPlayerRestraints():
			#if item.isRestraint():
			player.inventory.unequipItem(item)
	pass
	

static func setDefaultJson():
	var file = File.new()
	
	if file.open(other_config, File.WRITE) == OK:
		var data = defaultJson
		var json_string = JSON.print(data)
		file.store_string(json_string)
		file.close()
		CrimsonConsole.Log("Success! File saved at: " + other_config)
		return true
	else:
		CrimsonConsole.Log("Failed to open file for writing.")

func makeCrimsonCfg():
	var file = File.new()
	# is user://crimsonvulpes doesnt exist, assume no config
	var dir = Directory.new()
	if not dir.dir_exists("user://crimsonvulpes"):
		var _crimsonvulpes = Directory.new().make_dir("user://crimsonvulpes")
		
		if file.open(other_config, File.READ) != OK:
			var succeed = setDefaultJson()
			if !succeed:
				CrimsonConsole.Error("setDefaultJson failed!")
				return false
				
			CrimsonConsole.Log("default json was successful")
		else:
			CrimsonConsole.Log("config exists, get content")
			var _content = file.get_as_text()
			file.close()

func getLikedChars():
	var file = File.new()
	
	if file.open(other_config, File.READ) == OK:
		var content = file.get_as_text()
		file.close()
		
		var result = JSON.parse(content)
		var likedChars = null
		if result.error == OK:
			var json_data = result.result
			likedChars = json_data["likedChars"]
		else:
			var succeed = setDefaultJson()
			CrimsonConsole.Log("parsing error, attempting to set default json")
			if !succeed:
				CrimsonConsole.Error("getLikedChars failed!")
				return false
			CrimsonConsole.Log("default json was successful")
			likedChars = defaultJson
		return likedChars
		
	return null



static func get_files(use_base: bool, log_missing: bool, path: String) -> Array:
	var files = []
	var ignore_list = [
		"SnowDildoSex.gd",
		"Template.gd"
	]
	
	_scan_dir(path, files, use_base, log_missing, ignore_list)
	return files


static func _scan_dir(path: String, files: Array, use_base: bool, log_missing: bool, ignore_list: Array) -> void:
	var dir = Directory.new()
	
	if dir.open(path) != OK:
		if log_missing:
			Log.printerr("[CrimsonLib] Failed to open directory: " + path)
			# output_err()
		return
	
	dir.list_dir_begin(true, true) # skip . and .. and hidden
	
	while true:
		var name = dir.get_next()
		if name == "":
			break
		
		var full_path = path + "/" + name
		
		if dir.current_is_dir():
			
			# HARD block specific directories
			if name == "Models" or name == "Textures":
				continue
			
			# Recurse
			_scan_dir(full_path, files, use_base, log_missing, ignore_list)
		
		else:
			
			if not name.ends_with(".gd"):
				continue
			
			if name in ignore_list:
				continue
			
			if use_base:
				files.append(full_path)
			else:
				files.append(name)
	
	dir.list_dir_end()
	
