extends TextureProgress

func _ready():
	print(get_parent())
	set_fixed_process(true)
	
func _fixed_process(delta):
	set_value(get_parent().get_value())
