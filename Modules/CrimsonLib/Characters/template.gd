extends "res://CrimsonLib/CrimsonCharacter.gd"

func _getName():
	return "Template"

func _init():
	id = _getIdB("Template")
	
	_skinData = {
		"skinData": {
			
		},
		"pickedSkin": "EmptySkin",
		"pickedSkinRColor": Color.white,
		"pickedSkinGColor": Color.lightgray,
		"pickedSkinBColor": Color.darkgray,
	}
	
	# _hasInterests = true
	# _lustInterests = {}
	# _fetishes = {}

	_data = {
		"penisSize": 22,
		"ballsScale": 0.5,
		"breastsSize": 1,
		"tailScale": 1.2
	}

	_bodyparts = {
		"anus": "anuswomb",
		"arms": "fluffarms",
		"body": "fluffbody",
		"ears": "wolfears",
		"horns": null,
		"hair": "longhair",
		"head": "foxhead",
		"legs": "flufflegs",
		"tail": "caninetail",

		"penis": "caninepenis",
		"vagina": "vagina",
		"breasts": "fluffbreasts"
	}
