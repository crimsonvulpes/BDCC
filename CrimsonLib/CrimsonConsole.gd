extends Object
class_name CrimsonConsole

static func Log(message):
	Log.print("[FoxLib] " + message)

static func Error(message):
	Log.printerr("[FoxLib] " + message)
