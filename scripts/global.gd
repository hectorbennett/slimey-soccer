extends Node
var gamemode = String()

func _ready():
	set_process_input(true)
	
func _input(event):
	fullscreen_toggle(event)

func fullscreen_toggle(event):
	if (event.is_action("fullscreen_toggle") and event.is_pressed() and !event.is_echo()):
		if OS.is_window_fullscreen():
			OS.set_window_fullscreen(false)
		else:
			OS.set_window_fullscreen(true)