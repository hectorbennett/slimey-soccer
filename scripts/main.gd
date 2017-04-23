extends Node2D

onready var ball = load("res://scenes/ball.tscn").instance()
var ball_pos
var screen_size
var left_score = 0
var right_score = 0

var left_goal = Rect2()
var right_goal = Rect2()

func _ready():
	var countdown = get_node("countdown_label")
	countdown.connect("start",self,"_start")
	
	screen_size = get_viewport_rect().size
	var left_pos = get_node("left_pos").get_pos()
	var right_pos = get_node("right_pos").get_pos()
	left_goal = Rect2(0, screen_size.y - 256, 128, 256)
	right_goal = Rect2(screen_size.x - 128, screen_size.y - 256, 128, 256)
	
	#instancing players
	var left_slime = load("res://scenes/human.tscn").instance()
	left_slime.player_type = "left"
	left_slime.set_pos(left_pos)
	add_child(left_slime)
	
	if get_node("/root/global").gamemode == "1_player":
		var right_slime = load("res://scenes/ai.tscn").instance()
		right_slime.set_pos(right_pos)
		add_child(right_slime)
	if get_node("/root/global").gamemode == "2_player":
		var right_slime = load("res://scenes/human.tscn").instance()
		right_slime.player_type = "right"
		right_slime.set_pos(right_pos)
		add_child(right_slime)
	set_fixed_process(true)
	
func _fixed_process(delta):
	ball_pos = ball.get_pos()
		
	if left_goal.has_point(ball_pos):
		ball.set_pos(screen_size / 2)
		ball.set_linear_velocity(Vector2(0,0))
		right_score +=1
		get_node("countdown_anim").play("goal")
		get_node("right_score_label").set_text(str(right_score))
		
	if right_goal.has_point(ball_pos):
		ball.set_pos(screen_size / 2)
		ball.set_linear_velocity(Vector2(0,0))
		left_score +=1
		get_node("countdown_anim").play("goal")
		get_node("left_score_label").set_text(str(left_score))
		
	if get_node("timer_label").finished:
		get_node("winner_label").set_hidden(false)
		if left_score > right_score:
			get_node("winner_label").set_text("Left Player Wins!")
		if left_score < right_score:
			get_node("winner_label").set_text("Right Player Wins!")
		if left_score == right_score:
			get_node("winner_label").set_text("Draw!")
		get_tree().set_pause(true)

func _start():
	add_child(ball)
	ball.set_pos(screen_size/2)

func _on_restart_timer_timeout():
	get_tree().reload_current_scene()