extends Label

func _on_Timer_timeout():
	get_tree().change_scene("scenes/menu.tscn")
