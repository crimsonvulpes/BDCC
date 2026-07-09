import json
import sys
import os
from pathlib import Path

blankDictThing = {}

def generate_code(path: str):
    save = json.load( open(path) )

    player = save['player']

    gender = "Other"
    # pronouns = "Other"
    skinData = {}
    bodyparts_code = "	"
    
    equipment = []

	# Male,
	# Female,
	# Androgynous,
	# Other,
    if player['pickedGender'] == 0:
        gender = "Male"
    elif player['pickedGender'] == 1:
        gender = "Female"
    elif player['pickedGender'] == 2:
        gender = "Androgynous"
    elif player['pickedGender'] == 3:
        gender = "Other"

    # if player['pronounsGender'] == 0:
    #     pronouns = "Male"
    # elif player['pronounsGender'] == 1:
    #     pronouns = "Female"
    # elif player['pronounsGender'] == 2:
    #     pronouns = "Androgynous"
    # elif player['pronounsGender'] == 3:
    #     pronouns = "Other"

    for part in player['bodyparts']:
        if player['bodyparts'][part] != None:
            skinData[part] = {}
            for dataThing in player['bodyparts'][part]['data']:
                # "size", "ballsScale", "lengthCM", "tailScale", 
                
                if dataThing in ["r", "g", "b", "skin"]:
                    value = player['bodyparts'][part]["data"][dataThing]

                    if dataThing in ["r", "g", "b"]:
                        value = f'Color("{value}")'

                    skinData[part][dataThing] = value


    for part in player['bodyparts']:
        if player['bodyparts'][part] != None:
            if part == "breasts":
                bodyparts_code = bodyparts_code + f'''\n	var breasts = GlobalRegistry.createBodypart("{player['bodyparts'][part]['id']}")
	breasts.size = {player['bodyparts'][part]['data']['size']}
	giveBodypartUnlessSame(breasts)\n
    '''
            elif part == "penis":
                bodyparts_code = bodyparts_code + f'''\n	var penis = GlobalRegistry.createBodypart("{player['bodyparts'][part]['id']}")
	penis.lengthCM = {player['bodyparts'][part]['data']['lengthCM']}
	penis.ballsScale = {player['bodyparts'][part]['data']['ballsScale']}
	giveBodypartUnlessSame(penis)\n
    '''
            elif part == "tail":
                bodyparts_code = bodyparts_code + f'''var tail = GlobalRegistry.createBodypart("{player['bodyparts'][part]['id']}")
	tail.tailScale = {player['bodyparts'][part]['data']['tailScale']}
	giveBodypartUnlessSame(tail)
    '''
            else:
                bodyparts_code = bodyparts_code + f'''giveBodypartUnlessSame(GlobalRegistry.createBodypart("{player['bodyparts'][part]['id']}"))
    '''

    for slot in player["inventory"]['equipped_items']:
        equip_data = {}

        if player["inventory"]['equipped_items'][slot]['data'].get('clothesColor'):
            equip_data["clothesColor"] = player["inventory"]['equipped_items'][slot]['data'].get('clothesColor')

        equipment.append({
            "data": equip_data,
            "id": player["inventory"]['equipped_items'][slot]['id']
        })


    code = f'''# Created with CrimsonLib's save_player_to_character tool
extends Character

func _getName():
    # Change me as needed!
    return "{player['gamename']}"

func _init():
    id = "clib_{player['gamename'].lower()}"

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

    pickedSkin = "{player['pickedSkin']}"
    pickedSkinRColor = Color("{player['pickedSkinRColor']}")
    pickedSkinGColor = Color("{player['pickedSkinGColor']}")
    pickedSkinBColor = Color("{player['pickedSkinBColor']}")
    npcSkinData={skinData}

func getGender():
    return Gender.{gender}

# func getSmallDescription() -> String:
#     return "getSmallDescription"

func getSpecies():
    return {player['pickedSpecies']}

# func getChatColor():
#    return '#FFF60C'

func getThickness() -> int:
    return {player['pickedThickness']}

func getFemininity() -> int:
    return {player['pickedFemininity']}

func createBodyparts():
    # EDIT WHEN CREATING THE CHARACTER .gd FILE AS ITS CAUSES ERRORS
{bodyparts_code}
func getDefaultEquipment():
    return {equipment}
'''
    # Done with creating code..
    
    outDir = Path("char_convert_out")
    outDir.mkdir(exist_ok=True)

    baseName = Path(path).stem
    outFile = outDir / f"{baseName}.gd"
    i = 1
    
    while outFile.exists():
        outFile = outDir / f"{baseName} ({i}).gd"
        i += 1

    with outFile.open("w") as out:
        # code = code.replace('\\")"', '")')

        code = code.replace("    ", "	")
        code = code.replace("'Color", "Color")
        code = code.replace(")'", ")")

        out.write(code)
        # print(code)
	
# try:
#     fileGiven = sys.argv[1]

#     generate_code(fileGiven)
# except IndexError:


print("CrimsonLib - Save File Player to Character tool")
print("\n\nCurrent char saves (GAMEROOT/.crimson/char_saves)")

char_saves = []
if os.path.exists("char_saves"):
    for file in os.listdir("char_saves"):
        if os.path.isfile(f"charsaves\\{file}"):
            print(file)
            char_saves.append(file[:-5])

# char_saves = os.listdir("char_saves")
# if os.path.exists("char_saves"):
#     char_saves.clear()
#     for file in char_saves:
#         print(file)
#         char_saves.append

print("\n\n")    
try:
    while True:
        file = input("Input file name: ")

        if file.lower() in char_saves:
            # Made for windows.. so you'll likly need to edit this for Linux.. beware whoever is wanting to mod my mod or to use my mod.
            generate_code(f"{os.getcwd()}\\char_saves\\{file.lower()}.save")
        

        # add all - 04/07/2026
        if file.lower() == "all":
            for save_file in char_saves:
                generate_code(f"{os.getcwd()}\\char_saves\\{save_file}.save")
    
except KeyboardInterrupt:
    print("")
    exit

    # print("You need to drop a file onto this python file to use this tool.")
    # os.system("pause")