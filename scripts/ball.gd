extends RigidBody2D

var screen_size

func _ready():
	set_z(-1)
	screen_size = get_viewport_rect().size
	set_fixed_process(true)

func _fixed_process(delta):
	var ball_pos = get_global_pos()
	
	if ball_pos.y > screen_size.y + 32:
		set_pos(Vector2(ball_pos.x, screen_size.y - 256))
	if ball_pos.y < - 32:
		set_pos(Vector2(ball_pos.x, 256))
	if ball_pos.x > screen_size.x + 32:
		set_pos(Vector2(-256 , ball_pos.y))
	if ball_pos.x < - 32 :
		set_pos(Vector2(256 , ball_pos.y))