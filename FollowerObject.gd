extends KinematicBody2D

onready var Player = get_node("../MC_Sprite")
onready var label = get_node("Panel/Label")
onready var panel = get_node("Panel")
const GRAVITY = 20
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()
var react_time = 300
var direction = 0
var next_direction = 0
var next_direction_time = 0
var action_time = 0
var next_jump_time = -1
var velocity: Vector2
var pos 

func _ready():
	action_time = OS.get_ticks_msec() #for entering scene
	print(Player.position)
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		action_time = OS.get_ticks_msec()
	
func set_direction(target_direction):
	if next_direction != target_direction:
		next_direction = target_direction
		next_direction_time = OS.get_ticks_msec() + react_time
		
func _physics_process(delta):
	if Player.position.x < position.x - 50:
		set_direction(-1)
	elif Player.position.x > position.x + 50:
		set_direction(1)
	else:
		set_direction(0)
	
	if OS.get_ticks_msec() > next_direction_time:
		direction = next_direction
		
		
	##################################################################
	# supposed to mimic jump. I had trouble trying to get the player to jump
	# but it follows the player if he rises not when he falls, so maybe? 
	# otherwise comment out/delete
	if OS.get_ticks_msec() > next_jump_time and next_jump_time != -1:
		if Player.position.y < position.y - 50:
			velocity.y = -100
		next_jump_time = -1
	if Player.position.y < position.y - 50 and next_jump_time == -1:
		next_jump_time = OS.get_ticks_msec() + react_time
	
	velocity.x = direction * 100
	velocity.y != GRAVITY * delta
	if velocity.y > 100:
		velocity.y = 100
	if velocity.y > 0:
		velocity.y = 0
	#####################################################################
	
	if OS.get_ticks_msec() - action_time > 10000:
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
			label.set_text("Press 'a' to go through the door!")
		
		#adjust panel display	
		if Player.position.x < position.x:
			pos = Vector2(position.x + 20, position.y - 50)
			panel.set_global_position(pos)
		if Player.position.x > position.x:
			pos = Vector2(position.x - 130, position.y - 50)
			panel.set_global_position(pos)
		
		#display panel for 5 seconds
		panel.set_visible(true)
		yield(get_tree().create_timer(5.0), "timeout")
		panel.set_visible(false)
		
	#motion.x = 100 * direction
	velocity = move_and_slide(velocity, Vector2(0, -1))
