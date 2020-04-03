extends KinematicBody2D

onready var Player = get_node("../MC_Sprite")
onready var label = get_node("Panel/Label")
onready var panel = get_node("Panel")
const GRAVITY = 10
const RESISTANCE = Vector2(0,-1)
const UP = Vector2(0, -1) 
const JUMP_HEIGHT = -200

var motion = Vector2()
var react_time = 300
var direction = 0
var next_direction = 0
var next_direction_time = 0
var action_time = 0
var next_jump_time = -1
var velocity: Vector2
var pos 
var friction
var max_dis = 50

func _ready():
	action_time = OS.get_ticks_msec() #for entering scene
	print("player position: ", Player.get_position())
	print("my_position: ", get_position())

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		action_time = OS.get_ticks_msec()

func set_direction(target_direction):
	if next_direction != target_direction:
		next_direction = target_direction
		next_direction_time = OS.get_ticks_msec() + react_time

func _physics_process(delta):

	add_collision_exception_with(Player)
	#left and right movement Sprint 2
	if Player.position.x < position.x - max_dis:
		set_direction(-1)
	elif Player.position.x > position.x + max_dis:
		set_direction(1)
	else:
		set_direction(0)

	if OS.get_ticks_msec() > next_direction_time:
		direction = next_direction
#
	velocity.x = direction * Player.SPEED
	#velocity.y += GRAVITY
	#####################################################
	
	if position.y < 100:
		velocity.y = 0

	#jump motion
	if is_on_floor() and Player.position.y < position.y - 30:
		max_dis = 0
		#yield(get_tree().create_timer(0.05), "timeout")
		velocity.y += -160.0
	else:
		max_dis = 50
		velocity.y += GRAVITY
	
	#########################################

	var scene = get_tree().get_current_scene().get_name()

	if OS.get_ticks_msec() - action_time > 600000 and scene == "world":
		#reset action time	
		action_time = OS.get_ticks_msec()

		#check for events
		if !Globals.unlocked:
			label.set_text("Press the button!")
		elif get_node("../keyObject") and get_node("../keyObject").can_speak:
			label.set_text("Check out that key?")
		elif get_node("../NPC") and get_node("../NPC").can_speak:
			label.set_text("Hey! Who's that?'")
		else:
			label.set_text("Press 'z' to go through the door!")

		#adjust panel display	
		if Player.position.x < position.x:
			pos = Vector2(position.x + 20, position.y - 60)
			panel.set_global_position(pos)
		if Player.position.x > position.x:
			pos = Vector2(position.x - 130, position.y - 60)
			panel.set_global_position(pos)

		#display panel for 5 seconds
		panel.set_visible(true)
		yield(get_tree().create_timer(5.0), "timeout")
		panel.set_visible(false)

	#motion.x = 100 * direction
	velocity = move_and_slide(velocity, Vector2(0, -1))

	
	#Jared AI
	# Gonkee's follow AI for Godot 3 - full tutorial https://youtu.be/WXC8eBCEbho

# If you use this script in your own project, I would prefer it if you gave credit to me and my channel
#
#onready var Player = get_parent().get_node("MC_Sprite")
#
#const FLOOR_NORMAL = Vector2.UP
#var vel = Vector2(0, 0)
#
#var grav = 20
#var max_grav = 40
#
#var react_time = 400
#var dir = 0
#var next_dir = 0
#var next_dir_time = 0
#
#var next_jump_time = -1
#
#var target_player_dist = 140
#
#var eye_reach = 90
#var vision = 600
#
#func _ready():
#	set_process(true)
#
#func set_dir(target_dir):
#	if next_dir != target_dir:
#		next_dir = target_dir
#		next_dir_time = OS.get_ticks_msec() + react_time
#
#func sees_player():
#	var eye_center = get_global_position()
#	var eye_top = eye_center + Vector2(0, -eye_reach)
#	var eye_left = eye_center + Vector2(-eye_reach, 0)
#	var eye_right = eye_center + Vector2(eye_reach, 0)
#
#	var player_pos = Player.get_global_position()
#	var player_extents = Player.get_node("CollisionShape2D").shape.extents - Vector2(1, 1)
#	var top_left = player_pos + Vector2(-player_extents.x, -player_extents.y)
#	var top_right = player_pos + Vector2(player_extents.x, -player_extents.y)
#	var bottom_left = player_pos + Vector2(-player_extents.x, player_extents.y)
#	var bottom_right = player_pos + Vector2(player_extents.x, player_extents.y)
#
#	var space_state = get_world_2d().direct_space_state
#
#	for eye in [eye_center, eye_top, eye_left, eye_right]:
#		for corner in [top_left, top_right, bottom_left, bottom_right]:
#			if (corner - eye).length() > vision:
#				continue
#			var collision = space_state.intersect_ray(eye, corner, [], 1) # collision mask = sum of 2^(collision layers) - e.g 2^0 + 2^3 = 9
#
#			if collision and collision.collider.name == "Player":
#				return true
#	return false
#
#func _process(delta):
#
#	if Player.position.x < position.x - target_player_dist and sees_player():
#		set_dir(-1)
#	elif Player.position.x > position.x + target_player_dist and sees_player():
#		set_dir(1)
#	else:
#		set_dir(0)
#
#	if OS.get_ticks_msec() > next_dir_time:
#		dir = next_dir
#
#	if OS.get_ticks_msec() > next_jump_time and next_jump_time != -1 and is_on_floor():
#		if Player.position.y < position.y - 64 and sees_player():
#			vel.y = -800
#		next_jump_time = -1
#
#	vel.x = dir * 500
#
#	if Player.position.y < position.y - 64 and next_jump_time == -1 and sees_player():
#		next_jump_time = OS.get_ticks_msec() + react_time
#
#	vel.y += grav * delta;
#	if vel.y > max_grav:
#		vel.y = max_grav
#
#	if is_on_floor() and vel.y > 0:
#		vel.y = 0
#	vel = move_and_slide(vel, FLOOR_NORMAL)
#
	
