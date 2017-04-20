extends Node2D

var player_type = "left"
var left
var right
var jump

onready var sprite = get_node("slime/sprite")
onready var slime = get_node("slime")

var right_texture = preload("res://img/right_slime.png")
var left_texture = preload("res://img/left_slime.png")

func _ready():
	if player_type == "left":
		sprite.set_texture(left_texture)
		left = "lp_left"
		right = "lp_right"
		jump = "lp_jump"
	if player_type == "right":
		sprite.set_texture(right_texture)
		left = "rp_left"
		right = "rp_right"
		jump = "rp_jump"
		
	set_fixed_process(true)
	
func _fixed_process(delta):
	slime.move_left = Input.is_action_pressed(left)
	slime.move_right = Input.is_action_pressed(right)
	slime.jump = Input.is_action_pressed(jump)