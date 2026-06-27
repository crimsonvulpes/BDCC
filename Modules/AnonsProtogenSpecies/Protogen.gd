extends Species

func _init():
	id = "protogen"
	
func getVisibleName():
	return "Protogen"

func getDefaultLegs(_gender):
	return "protolegs"

func getDefaultTail(_gender):
	return "prototail"

func isPlayable():
	return true

func getVisibleDescription():
	return "Fluffy cyborgs made by some unknown entity"

func getDefaultHead(_gender):
	return "protogenhead"

func getDefaultArms(_gender):
	return "protoarms"

func getDefaultEars(_gender):
	return "ProtoEars"

func getDefaultBody(_gender):
	return "protobody"

func getDefaultPenis(_gender):
	if(_gender in [Gender.Male, Gender.Androgynous]):
		return "caninepenis"
	else:
		return null

func getEggCellOvulationAmount():
	return [
		[2, 3.0],
		[3, 6.0],
		[4, 8.0],
		[5, 6.0],
		[6, 4.0],
		[7, 1.0],
	]

#remember to add/remove anus and anus womb depending on breed edition
func getAllowedBodyparts():
	return ["wolfears, caninetail, huskytail"]

func onDynamicNpcCreation(_npc, _args):
	#This would force this species to generate with the listed skin, we are using the variable npcSkinData instead to only select specific parts
	#_npc.pickedSkin = "protogenskin"
	
	#We are outlining which bodyparts will always have the specified skin
	var npcSkinData={
	"body": {"skin": "protogenskin",},
	"arms": {"skin": "protogenskin",},
	"legs": {"skin": "protogenskin",},
	}
	
	for bodypartSlot in npcSkinData:
		if(!_npc.hasBodypart(bodypartSlot)):
			#Log.error(getID()+" doesn't have "+str(bodypartSlot)+" slot but we're trying to paint it anyway inside paintBodyparts()")
			continue
		var bodypart = _npc.getBodypart(bodypartSlot)
		var bodypartSkinData = npcSkinData[bodypartSlot]
		if(bodypartSkinData.has("skin")):
			bodypart.pickedSkin = bodypartSkinData["skin"]
	_npc.updateAppearance()
