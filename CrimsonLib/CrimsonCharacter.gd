extends Character
class_name CrimsonCharacter

var _fluidType = null
var _level = 10
var _basePain = 150
var _baseStamina = 150
var _characterType = CharacterType.Inmate
var _hasInterests = false
var _lustInterests = {}
var _fetishes = {}
var _skinData = {
	"skinData": {},
	"pickedSkin": "EmptySkin",
	"pickedSkinRColor": Color.white,
	"pickedSkinGColor": Color.lightgray,
	"pickedSkinBColor": Color.darkgray,
}

var _data = {
	"penisSize": 18,
	"ballsScale": 0.5,
	"breastsSize": 2,
	"tailScale": 1
}

var _bodyparts = {
	"anus": "anus",
	"arms": "anthroarms",
	"body": "anthrobody",
	"ears": "felineears",
	"hair": "longhair",
	"head": "felinehead",
	"horns": null,
	"legs": "digilegs",
	"tail": "felinetail",

	"penis": null,
	"vagina": null,
	"breasts": null
}

var _femininity = 100
var _thickness = 50

# Best not to use this out of _init??
func _getIdB(c_id, s_id := "clib_") -> String:
	return s_id + "_" + c_id

func _getId(): return id
func getID(): return id
func id(): return id

func setData():
	pass


#func _realInit():
#	setData()
#	_register()

#	id = "clib_" + char_id

func _init():
	# Set stuff here
	pass

func _register():
	npcLevel = _level
	npcBasePain = _basePain
	npcBaseStamina = _baseStamina
	
	npcCharacterType = _characterType
	
	if _hasInterests:
		## More...
		if _lustInterests != null:
			npcLustInterests = _lustInterests
			
		if npcFetishes != null:
			npcFetishes = _fetishes
		
	npcHasMenstrualCycle = true
	
	## Fucking dumb null checks.. (was very dumb before.. many if statments)
	npcSkinData = FoxyBusiness.getValue(_skinData, "skinData", {})
	pickedSkin = FoxyBusiness.getValue(_skinData, "pickedSkin", "EmptySkin")
	pickedSkinRColor = FoxyBusiness.getValue(_skinData, "pickedSkinRColor", Color.white)
	pickedSkinGColor = FoxyBusiness.getValue(_skinData, "pickedSkinGColor", Color.lightgray)
	pickedSkinBColor = FoxyBusiness.getValue(_skinData, "pickedSkinBColor", Color.darkgray)
		

func _setBodyparts():
	pass

func createBodyparts():
	for partType in _bodyparts:
		# Anything but null
		if _bodyparts[partType] != null:
			# Hard-coded types because of varibles that has to be used, like dick length
			if partType == "penis":
				var benis = GlobalRegistry.createBodypart(_bodyparts[partType])
				var scale:float = FoxyBusiness.getValue(_data, "ballsScale", 0.5)
				benis.lengthCM = FoxyBusiness.getValue(_data, "penisSize", 18)
				print(scale)
				benis.ballsScale = scale
			elif partType == "breasts":
				var breast = GlobalRegistry.createBodypart(_bodyparts[partType])
				breast.size = FoxyBusiness.getValue(_data, "breastsSize", 2)
			elif partType == "tail":
				var tail = GlobalRegistry.createBodypart(_bodyparts[partType])
				tail.tailScale = FoxyBusiness.getValue(_data, "tailScale", 1)
			else:
				giveBodypartUnlessSame(GlobalRegistry.createBodypart(_bodyparts[partType]))
	
func getThickness() -> int:
	return _thickness

func getFemininity() -> int:
	return _femininity

func getFluidType(_fluidSource):
	if _fluidType != null:
		if typeof(_fluidType) == TYPE_STRING:
			return _fluidType
		else:
			FoxConsole.Log("fluidType is not a string... value is '" + _fluidType)
