extends Node2D

onready var sprite = get_node("slime/sprite")
onready var slime = get_node("slime")
var self_pos
var ball
var ball_x
var ball_y
var ball_vel
var player
var player_pos
var screen_size

var ai_texture = preload("res://img/ai_slime.png")

func _ready():
	screen_size = get_viewport_rect().size
	sprite.set_texture(ai_texture)
	ball = get_parent().get_node("ball")
	set_fixed_process(true)
	
func _fixed_process(delta):
	ball_vel = ball.get_linear_velocity()
	ball_x = ball.get_global_pos().x
	ball_y = ball.get_global_pos().y
	self_pos = slime.get_global_pos()
	
	if abs(ball_x - self_pos.x) < 200 and ball_y < 1350 and ball_y > 1100 and abs(ball_vel.y) < 300:
		slime.jump = true
	else:
		slime.jump = false	
	
	if (abs(ball_vel.y) > 100) or (ball_y < 400) or (ball_x < 600) or (ball_x > self_pos.x - 320 and ball_vel.x > -1 ):
		slime.move_right = true
	else:
		slime.move_right = false	
		
	if (ball_x <= self_pos.x - 300 and ball_vel.x < 100 ) or (10 < abs(ball_vel.x) and abs(ball_vel.x) < 200 and ball_x < self_pos.x) or self_pos.x > 2400:
		slime.move_left = true
	else:
		slime.move_left = false