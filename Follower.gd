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
	##########left and right movement Sprint 2##########
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
	#####################################################
	
	if position.y < 100:
		velocity.y = 0

	#################jump motion############################
	if is_on_floor() and Player.position.y < position.y - 30:
		max_dis = 0
		velocity.y += -160.0
	else:
		max_dis = 50
		velocity.y += GRAVITY
	
	#####################################################

	var scene = get_tree().get_current_scene().get_name()

	#if 10 min. has passed and we are in the correct scene
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
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
