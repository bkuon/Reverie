extends KinematicBody2D

var motion = Vector2()

const UP = Vector2(0,-1)
const GRAVITY = 20
const ACCELERATION = 10
const MAX_SPEED = 300
const JUMP_HEIGHT = -500
export var speed = 10.0


func _physics_process(delta):
	
	motion.y += GRAVITY
	var friction = false 
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("walk")	
	else:
		$Sprite.play("idle")
		friction = true 
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		motion.x = 0
		$Sprite.play("idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: 
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion, UP)
	
	pass
	
