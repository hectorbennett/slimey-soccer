extends Label

var time = 120
var minutes = float()
var seconds = float()
onready var timer = get_node("timer")
var finished = false

func set_time():
	minutes = str(floor(time / 60))
	if int(time) % 60 <= 9:
		seconds = "0" + str(int(time) % 60)
	else:
		seconds = str(int(time) % 60)
	set_text(minutes + ":" + seconds)

func _ready():
	set_time()

func _on_timer_timeout():
	if time > 1:
		timer.start()	
	else:
		finished = true
		get_parent().get_node("restart_timer").start()
	time -= 1
	set_time()
	
	if time == 10:
		set("custom_colors/font_color",Color(1,0.4,0.4))