# Created with CrimsonLib's save_player_to_character tool        
extends "res://CrimsonLib/CrimsonCharacter.gd"

func _getName():
    return "Player"

func _init():
    id = _getIdB("Player")

    _skinData = {
    "skinData": {
        "anus": {},
        "arms": {
            "g": Color("ff4c7e7f"),
            "skin": "bluey_segaaidan_skin"
        },
        "body": {},
        "breasts": {},
        "ears": {
            "b": Color("ff3c5859"),
            "g": Color("ff2e4747"),
            "r": Color("ff486a6b")
        },
        "hair": {
            "b": Color("ff2c5f99"),
            "g": Color("ff4a85c7"),
            "r": Color("ff559be1")
        },
        "head": {
            "skin": "AngledSkin"
        },
        "horns": {},
        "legs": {
            "g": Color("ff4c7e7f"),
            "skin": "bluey_segaaidan_skin"
        },
        "penis": {
            "b": Color("ff4de6ca"),
            "g": Color("ff4de6ca"),
            "r": Color("fff9f9f9")
        },
        "tail": {
            "g": Color("ffcbfffa"),
            "r": Color("ffffffff"),
            "skin": "EmptySkin"
        },
        "vagina": {}
    },
    "pickedSkinRColor": "ffcbfffa",
    "pickedSkinGColor": "ffffffff",
    "pickedSkinBColor": "ff8afff6"
}

    # _hasInterests = true
    # _lustInterests = blankDictThing
    # _fetishes = blankDictThing
    
    _data = {
    "penisSize": 18,
    "ballSize": 0.8,
    "breastSize": -1,
    "tailScale": 1
}
    
    _bodyparts = {
    "anus": "anus",
    "arms": "fluffarms",
    "body": "fluffbody",
    "ears": "felineears2",
    "horns": null,
    "hair": "combedbackhair",
    "head": "fur_faux_head",
    "legs": "flufflegs",
    "tail": "bluey_segaaidan_tail",
    "penis": "caninepenis",
    "vagina": "vagina",
    "breasts": "fluffmalebreasts"
}

func getThickness() -> int:
    return 50

func getFemininity() -> int:
    return 0

func getGender():
    return Gender.Female

func getSpecies():
    return ['arctic_fox']

func getDefaultEquipment():
    return []
