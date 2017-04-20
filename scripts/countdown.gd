extends Label

var time = 3
onready var timer = get_node("timer")

func _ready():
	get_parent().get_node("countdown_anim").play("scale")
	set_text(str(time))

func _on_timer_timeout():
	
	if time <= 0:
		set_hidden(true)
	if time == 1:
		get_parent().get_node("countdown_anim").play("scale")
		time -= 1
		set_text("GO!")
		get_tree().set_pause(false)
		timer.start()
	if time > 0:
		get_parent().get_node("countdown_anim").play("scale")
		time -= 1
		set_text(str(time))	
		timer.start()

	if time == 1:
		set("custom_colors/font_color",Color(1,1,0.4))
	if time == 0:
		set("custom_colors/font_color",Color(0.5,1,0.5))