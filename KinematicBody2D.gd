extends KinematicBody2D

var motion = Vector2()

const UP = Vector2(0,-1)
const GRAVITY = 20
const ACCELERATION = 10
const MAX_SPEED = 300
const JUMP_HEIGHT = -500
export var speed = 10.0



func _physics_process(delta):
		
	if MC_Globals.canJump:
		$CanvasLayer/jumpIcon.visible=true
	if MC_Globals.canRun:
		$CanvasLayer/runIcon.visible=true
	if MC_Globals.canCrawl:
		$CanvasLayer/jumpCrawl.visible=true
	
	motion.y += GRAVITY
	var friction = false 
	$CanvasLayer/jumpIcon.play("default")
	
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
		if Input.is_action_just_pressed("ui_up") && MC_Globals.canJump:
			motion.y = JUMP_HEIGHT
			MC_Globals.isJumping=true
				
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: 
			$Sprite.play("Jump")
			$CanvasLayer/jumpIcon.play("active")
		else:
			$Sprite.play("Fall")
			MC_Globals.isJumping=false
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
	if MC_Globals.victory:
		$Sprite.play("victory")
		_on_Sprite_animation_finished()
	
		
	motion = move_and_slide(motion, UP)
	
	
	
	pass
	


func _on_Sprite_animation_finished():
	 MC_Globals.victory=false
