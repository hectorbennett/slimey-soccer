extends TextureProgress

func _ready():
	set_value(get_parent().get_value())

func _on_volume_slider_value_changed(value):
	set_value(value)