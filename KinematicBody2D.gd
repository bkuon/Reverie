extends KinematicBody2D

#Jump Physics [Brandon Edit 3/13]
const UP = Vector2(0, -1) 
const JUMP_HEIGHT = -200
#End Jump Variable

#Run Physics [Brandon Edit 3/13]
const ACCELERATION = 50
const MAX_SPEED = 150
#End Run Variable 

#Duck Speed Variable [Brandon Edit 3/13]
const DUCK_SPEED = 20

const GRAVITY = 20
const SPEED = 80
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()
var obj_name: String
var obj = null
var can_move = true

func _physics_process(delta):
	motion.y += GRAVITY
	#Add Variable Friction
	var friction = false
	
	if can_move:
		if Input.is_action_pressed("ui_right"):
			motion.x= SPEED
			$sprite.flip_h = false
			$sprite.play("walk")
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$sprite.flip_h = true
			$sprite.play("walk")
			
		else:
			motion.x=0
			$sprite.play("idle")
		
		#Run Ability alongside jump utilities implemented here.
		if Input.is_action_pressed("ui_right") and Input.is_key_pressed(KEY_V):
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
			$sprite.flip_h = false
			$sprite.play("run")
			if is_on_floor():
				if Input.is_action_just_pressed("ui_up"):
					motion.y = JUMP_HEIGHT
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.2)
			else:
				if motion.y < 0: 
					$sprite.play("Jump")
				else:
					$sprite.play("Fall")
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.05)
			motion = move_and_slide(motion, UP)
	
			move_and_slide(motion,RESISTANCE)
		if Input.is_action_pressed("ui_left") and Input.is_key_pressed(KEY_V):
			motion.x = min(motion.x - ACCELERATION, MAX_SPEED)
			$sprite.flip_h = true
			$sprite.play("run")
		
			if is_on_floor():
				if Input.is_action_just_pressed("ui_up"):
					motion.y = JUMP_HEIGHT
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.2)
			else:
				if motion.y < 0: 
					$sprite.play("Jump")
				else:
					$sprite.play("Fall")
				if friction == true:
					motion.x = lerp(motion.x, 0, 0.05)
			motion = move_and_slide(motion, UP)
	
			move_and_slide(motion,RESISTANCE)
		#End Run And Jump edits here [Brandon 3/13]
		
		
		if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
			motion.x=0
			$sprite.play("idle")
		
			
		motion = move_and_slide(motion,RESISTANCE)
		
	if Input.is_action_just_pressed("interact"):
		if obj and obj_name != "" and obj_name != "Door" and obj.can_speak:
			can_move = false
			#$sprite.play("idle")
			get_node("../DialogueParser").init_dialogue(obj_name)
	
	#Jump Implementation done here 
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: 
			$sprite.play("Jump")
		else:
			$sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
			
			
	#Implement Duck Function
	if Input.is_action_pressed("ui_down"):
		#$sprite.play("duck")
		motion.x = 0
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		#$sprite.play("duck")
		motion.x = DUCK_SPEED
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		#$sprite.flip_h = true
		#$sprite.play("duck")
		motion.x = -DUCK_SPEED
	#End Duck Function

	motion = move_and_slide(motion, UP)
	
	move_and_slide(motion,RESISTANCE)
	
	
#signals when player is touching object. 
#gets object name for DialogueParser
func _on_Area2D_area_entered(area):
	obj_name = area.name
	obj = area.get_parent()
	
	
	
func _on_Area2D_area_exited(area):
	obj = ""
	
# custom signal says that the item has been checked for/ or has finished dialogue
func _on_DialogueParser_done_talking():
	obj.can_interact = true
	obj.can_speak = false
	can_move = true

func teleport_to(target_pos):
	position = target_pos

