extends Module

func _init():
	id = "ClothingRevamp"
	author = "bringleBangul"
	

	items = [
		"res://Modules/ClothingRevamp/Uniforms/InmateUniformGeneral.gd",
		"res://Modules/ClothingRevamp/Uniforms/InmateUniformHighSec.gd",
		"res://Modules/ClothingRevamp/Uniforms/InmateUniformSexDeviant.gd",
		"res://Modules/ClothingRevamp/Underwear/LaceBra.gd",
		"res://Modules/ClothingRevamp/Underwear/LacePanties.gd",
		"res://Modules/ClothingRevamp/Underwear/PlainBra.gd",
		"res://Modules/ClothingRevamp/Underwear/PlainBriefs.gd",
		"res://Modules/ClothingRevamp/Underwear/PlainPanties.gd",
		"res://Modules/ClothingRevamp/Underwear/PlainUndershirt.gd",
		"res://Modules/ClothingRevamp/Underwear/SportyBriefs.gd",
		"res://Modules/ClothingRevamp/Underwear/SportyTankTop.gd",
		"res://Modules/ClothingRevamp/Underwear/SportyTop.gd",
		#"res://Modules/ClothingRevamp/outfitgiver.gd"
	]
	lustActions = [
		"res://Modules/ClothingRevamp/ModuleLustActions/BraPullUp.gd",
		"res://Modules/ClothingRevamp/ModuleLustActions/BraShakeOff.gd",
		"res://Modules/ClothingRevamp/ModuleLustActions/PantiesMoveAside.gd",
		"res://Modules/ClothingRevamp/ModuleLustActions/PantiesPullDown.gd",
		"res://Modules/ClothingRevamp/ModuleLustActions/PantiesShakeOff.gd",
	]
	sexActivities = [
		"res://Modules/ClothingRevamp/ModuleSexActivity/DomUndressesSub.gd",
		"res://Modules/ClothingRevamp/ModuleSexActivity/SubUndressActions.gd",
		"res://Modules/ClothingRevamp/ModuleSexActivity/DomUndressActions.gd",
		"res://Modules/ClothingRevamp/ModuleSexActivity/OrderToUndress.gd",
	]
	scenes = [
		"res://Modules/ClothingRevamp/ModuleScene/ClothingAdjustState.gd"
	]



const MoreUniformsPath = "res://Modules/LongUniform/Uniforms"
	
func postInit():
# dumb hack to see if MoreUniforms is loaded
	GlobalRegistry.registerItemFolder(MoreUniformsPath)
	var _orange = GlobalRegistry.getItemRef("inmateuniformlong")
	if(!_orange == null):
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CropTopUniform.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CropTopRed.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CropTopLilac.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUniform.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUniformLilac.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/LongUniformRed.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/MaternityUniform.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/MaternityUniformLilac.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/MaternityUniformRed.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/ShirtOnlyUniform.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/ShirtOnlyRed.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/ShirtOnlyLilac.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/BottomsOnlyUniform.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/BottomsOnlyRed.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/HalfUniformFix/BottomsOnlyLilac.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CowBra.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CowBriefs.gd")
		GlobalRegistry.registerItem("res://Modules/ClothingRevamp/MoreUniforms_compatibility/CowPanties.gd")
