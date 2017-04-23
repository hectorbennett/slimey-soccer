extends Container

func _ready():
	get_tree().set_pause(false)
	set_hidden(true)
	set_process_input(true)
	
func _input(event):
	if event.is_action("ui_cancel") and event.is_pressed() and !event.is_echo():
		print('yes')
		pause_menu()
		
func pause_menu():
	if get_tree().is_paused() == false:
		get_node("menu").grab_focus()
		set_hidden(false)
		get_tree().set_pause(true)
		
	else:
		set_hidden(true)
		get_tree().set_pause(false)

func _on_menu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("scenes/menu.tscn")

func _on_restart_pressed():
	get_tree().reload_current_scene()
