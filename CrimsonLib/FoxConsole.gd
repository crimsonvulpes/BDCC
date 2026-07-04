extends Object
class_name FoxConsole

static func Log(message):
	Log.print("[FoxLib] " + message)

static func Error(message):
	Log.printerr("[FoxLib] " + message)
