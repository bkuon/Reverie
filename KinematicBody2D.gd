extends KinematicBody2D

#Added variables for Jump
const UP = Vector2(0, -1)
const JUMP_HEIGHT = -200
#Brandon 3/12 

#Added Variables for Run
const ACCELERATION = 50
const MAX_SPEED = 200
#Brandon 3/12

#Duck Speed
const DUCK_SPEED = 50

export var speed = 10.0 

const GRAVITY = 20
const SPEED = 100
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()
var obj_name: String
var obj = null

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x= SPEED
		$sprite.flip_h = false
		$sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$sprite.flip_h = true
		$sprite.play("walk")
	elif Input.is_action_just_pressed("interact"):
		if obj and obj_name != "" and obj_name != "Door" and obj.can_speak:
			get_node("../DialogueParser").init_dialogue(obj_name)
	elif is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		else:
			$sprite.play("jump")
	else:
		motion.x=0
		$sprite.play("idle")
	#Ability to run implemented here
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
		
	
	
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		motion.x=0
		$sprite.play("idle")
	
	#Ability to duck here
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
	
	#Ability to jump implemented here
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
