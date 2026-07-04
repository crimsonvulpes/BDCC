import json
import sys
import os
from pathlib import Path

blankDictThing = {}

def generate_code(path: str):
    file = json.load( open(path) )

    # Player Data
    player = file["player"]
    bodyparts = player["bodyparts"]

    equipped_items = player["inventory"]["equipped_items"]


    femininity = player["pickedFemininity"]
    pickedGender = player["pickedGender"]
    pickedSkin = player["pickedSkin"]

    pickedSkinBColor = player["pickedSkinBColor"]
    pickedSkinGColor = player["pickedSkinGColor"]
    pickedSkinRColor = player["pickedSkinRColor"]
    pickedSpecies = player["pickedSpecies"]

    pickedThickness = player["pickedThickness"]
    pronounsGender = player["pronounsGender"]
    
    # Set the things for the code
    skinData = {}
    
    _data = {
        "penisSize": 22,
        "ballsScale": 0.5,
        "breastSize": 1,
        "tailScale": 1.2
	}
    _bodyparts = {
		"anus": "anuswomb",
		"arms": "fluffarms",
		"body": "fluffbody",
		"ears": "wolfears",
		"horns": None,
		"hair": "longhair",
		"head": "foxhead",
		"legs": "flufflegs",
		"tail": "caninetail",

		"penis": "caninepenis",
		"vagina": "vagina",
		"breasts": "fluffbreasts"
	}


    for part in bodyparts:
        skinData[part] = {}

        if bodyparts[part] != None:
            for dataThing in bodyparts[part]["data"]:
                # "size", "ballsScale", "lengthCM", "tailScale", 
                if dataThing in ["r", "g", "b", "skin"]:
                    value = bodyparts[part]["data"][dataThing]

                    if dataThing in ["r", "g", "b"]:
                        value = f'Color("{value}")'

                    skinData[part][dataThing] = value
                    # print(dataThing)
                
                if dataThing == "size":
                    _data["breastSize"] = bodyparts[part]["data"][dataThing]
                elif dataThing == "ballsScale":
                    _data["ballsScale"] = bodyparts[part]["data"][dataThing]
                elif dataThing == "lengthCM":
                    _data["penisSize"] = bodyparts[part]["data"][dataThing]
                elif dataThing == "tailScale":
                    _data["tailScale"] = bodyparts[part]["data"][dataThing]

            _bodyparts[part] = bodyparts[part]["id"]

    _skinData = {
        "skinData": skinData,
		"pickedSkinRColor": pickedSkinRColor,
		"pickedSkinGColor": pickedSkinGColor,
		"pickedSkinBColor": pickedSkinBColor
    }

    outDir = Path("char_convert_out")
    outDir.mkdir(exist_ok=True)

    baseName = Path(path).stem
    outFile = outDir / f"{baseName}.gd"
    i = 1
    
    while outFile.exists():
        outFile = outDir / f"{baseName} ({i}).gd"
        i += 1
    
    with outFile.open("w") as out:
        code = f'''# Created with CrimsonLib's save_player_to_character tool        
extends "res://CrimsonLib/CrimsonCharacter.gd"

func _getName():
    return "{player['gamename']}"

func _init():
    id = _getIdB("{player['gamename']}")

    _skinData = {json.dumps(_skinData, indent=4)}
	
    # _hasInterests = true
    # _lustInterests = blankDictThing
    # _fetishes = blankDictThing
    
    _data = {json.dumps(_data, indent=4)}
    
    _bodyparts = {json.dumps(_bodyparts, indent=4)}

func getThickness() -> int:
    return {pickedThickness}

func getFemininity() -> int:
    return {femininity}

func getGender():
    return Gender.Female
	
func getSpecies():
    return {pickedSpecies}
	
func getDefaultEquipment():
    return []

'''
        code = code.replace('"Color(\\', "Color(")
        code = code.replace('\\")"', '")')
        out.write(code)
        print(code)
    


            # json.dumps(
            #     {
            #         "message": "Fluffy Helper's Web API",
            #         "note": "Please DO NOT abuse OR exploit the API.. That'll get you banned from our server and further use with this API.",
            #         "version": cache_endpoints["ver"],
            #         "endpoints": {
            #             "public": cache_endpoints["public"],
            #             "authenticated": cache_endpoints["auth"]
            #         }
            #     },
            #     indent=4
            # ),
    
try:
    fileGiven = sys.argv[1]

    generate_code(fileGiven)
except IndexError:
    print("CrimsonLib - Save File Player to Character tool")
    print("\n\nCurrent char saves (GAMEROOT/.crimson/char_saves)")
    char_saves = os.listdir("char_saves")
    if os.path.exists("char_saves"):
        for file in char_saves:
            print(file)

    print("\n\n")    

    while True:
        file = input("Input file name: ")

        if file.lower() in char_saves:
            # Made for windows.. so you'll likly need to edit this for Linux.. beware whoever is wanting to mod my mod or to use my mod.
            generate_code(f"{os.getcwd()}\\char_saves\\{file.lower()}")
    

    # print("You need to drop a file onto this python file to use this tool.")
    # os.system("pause")