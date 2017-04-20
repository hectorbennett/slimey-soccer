extends RigidBody2D

var screen_size = Vector2()

var gravity = 30
var force = 1500
var friction = 1
var jump_force = 1000
var acc = Vector2()
var vel = Vector2()
var pos = Vector2()

var on_floor = false

var move_left = false
var move_right = false
var jump = false

func _ready():
	screen_size = get_viewport_rect().size
	pos = get_global_pos()
	set_fixed_process(true)
	
func _fixed_process(delta):
	if pos.y < screen_size.y - 96:
		vel.y += gravity
		on_floor = false
	else:
		on_floor = true
		vel.y = 0
	
	if on_floor and jump:
		vel.y = - jump_force
	
	if move_left:
		acc.x = -force
	elif move_right:
		acc.x = force
	else:
		acc.x = 0
		
	if pos.x > screen_size.x:
		vel.x = 0
		acc.x = 0
		pos.x = screen_size.x
		
	if pos.x < 0:
		vel.x = 0
		acc.x = 0
		pos.x = 0
		
	acc.x += vel.x * -friction
	vel += acc * delta
	pos += vel * delta
	
	set_global_pos(pos)