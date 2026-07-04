extends Object
class_name CrimsonGlobals
#public_api
#nodebug

# Abusing Godot 3 behaviour to make globals as it doesn't support "static var"
# This will not work on Godot 4, unless "const" is replaced by "static var" 
const globals = {}

static func getFoxLibCharacters():
	var s2cChars = []
	for id in GlobalRegistry.getCharacters():
		var character = GlobalRegistry.getCharacter(id)
		id = id.to_lower()
		
		# Are we SURE it's a CrimsonLib character?
		if id.begins_with("clib") or id.begins_with("crimson"):
			s2cChars.append({
				"id": character.id,
				"name": character.getName()
			})
	
	return s2cChars
