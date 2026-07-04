extends EventBase

const Globals = preload("res://FoxLib/Globals.gd")

var crimsonlib = null

func _init():
	id = "CLib_Event_Menu"
	
	crimsonlib = Globals.ofModule("CrimsonLib")

func registerTriggers(es):
	es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
	if crimsonlib.cheatie:
		addButton("CrimsonLib Cheat Menu", "", "change_floor")
		# addButton("Vendomat", "", "change_scene", ["VendomatScene"])
		
		#### Prev
		# 1 - change_scene ("Menu_Main")
		# 2 - addExtraButtonAt(4, "text", "tooltip", "change_floor")

func onButton(_method, _args):
	# addMessage("nya~")
	if ( _method == "change_scene" ):
		runScene("CLib"+_args[0]) 
	if ( _method == "change_floor" ):
		GM.pc.setLocation("clib_entrance")
		GM.main.reRun()
