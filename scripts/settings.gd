extends Control

var global

func _ready():
	get_node("music_slider").grab_focus()
	global = get_node("/root/global")

func _on_menu_button_pressed():
	get_tree().change_scene("scenes/menu.tscn")

func _on_duration_array_button_selected( button_idx ):
	if button_idx == 0:
		global.game_length = 30
	if button_idx == 1:
		global.game_length = 60
	if button_idx == 2:
		global.game_length = 120
	if button_idx == 3:
		global.game_length = 300
