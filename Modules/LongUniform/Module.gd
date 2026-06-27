extends Module

func _init():
	id = "LongUniform"
	author = "Anon, MaxMaxou"
	
	#Bottoms only and Shirts Only Uniforms only have two damage states instead of 3 because they reuse underwear code to make better sense.
	#Renamed a bunch of things to be more understandable to the human mind, but not everything was included, mostly shirt only and bottoms only uniforms with a bunch of unused damage states because of how their clothing states work

	items = [
		"res://Modules/LongUniform/Uniforms/LongUniform.gd",
		"res://Modules/LongUniform/Uniforms/LongUniformLilac.gd",
		"res://Modules/LongUniform/Uniforms/LongUniformRed.gd",
		"res://Modules/LongUniform/Uniforms/CropTopUniform.gd",
		"res://Modules/LongUniform/Uniforms/CropTopLilac.gd",
		"res://Modules/LongUniform/Uniforms/CropTopRed.gd",
		"res://Modules/LongUniform/Uniforms/MaternityUniform.gd",
		"res://Modules/LongUniform/Uniforms/MaternityUniformLilac.gd",
		"res://Modules/LongUniform/Uniforms/MaternityUniformRed.gd",
		"res://Modules/LongUniform/Uniforms/ShirtOnlyUniform.gd",
		"res://Modules/LongUniform/Uniforms/ShirtOnlyLilac.gd",
		"res://Modules/LongUniform/Uniforms/ShirtOnlyRed.gd",
		"res://Modules/LongUniform/Uniforms/BottomsOnlyUniform.gd",
		"res://Modules/LongUniform/Uniforms/BottomsOnlyRed.gd",
		"res://Modules/LongUniform/Uniforms/BottomsOnlyLilac.gd",
		"res://Modules/LongUniform/Misc Clothes/NipTape.gd",
		"res://Modules/LongUniform/Misc Clothes/PussyTape.gd",
		"res://Modules/LongUniform/Misc Clothes/CowBra.gd",
		"res://Modules/LongUniform/Misc Clothes/CowBriefs.gd",
		"res://Modules/LongUniform/Misc Clothes/CowPanties.gd",
		"res://Modules/LongUniform/Misc Clothes/ChestWraps.gd",
		"res://Modules/LongUniform/Harnesses/6pointHarness.gd",
		"res://Modules/LongUniform/Harnesses/8pointHarness.gd",
		"res://Modules/LongUniform/Harnesses/BellyHarness.gd",
		"res://Modules/LongUniform/Harnesses/ChestHarness.gd",
		"res://Modules/LongUniform/Harnesses/FullHarness.gd",
		"res://Modules/LongUniform/Harnesses/MaxHarness.gd",
		"res://Modules/LongUniform/Harnesses/RestrictionHarness.gd",
	]
