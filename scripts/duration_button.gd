extends Button

var options = [["30 seconds", 30], ["1 minute", 60], ["2 minutes", 120], ["3 minutes", 180], ["5 minutes", 300]]
var option = 2

func set_time():
	set_text(options[option % options.size()][0])
	get_node("/root/global").game_length = options[option % options.size()][1]

func _ready():
	get_node("arrows").set_hidden(true)
	set_time()
	
func _input(event):
	if (event.is_action("ui_right") and event.is_pressed() and !event.is_echo()):
		option +=1
		set_time()
	if (event.is_action("ui_left") and event.is_pressed() and !event.is_echo()):
		option -=1
		set_time()

func _on_duration_button_focus_enter():
	set_process_input(true)
	get_node("arrows").set_hidden(false)

func _on_duration_button_focus_exit():
	set_process_input(false)
	get_node("arrows").set_hidden(true)
