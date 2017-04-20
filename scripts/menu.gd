extends Node2D

func _ready():
	get_node("container/1p_button").grab_focus()

func _on_1p_button_pressed():
	get_node("/root/global").gamemode = "1_player"
	get_tree().change_scene("scenes/main.tscn")

func _on_2p_button_pressed():
	get_node("/root/global").gamemode = "2_player"
	get_tree().change_scene("scenes/main.tscn")