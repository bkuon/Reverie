extends KinematicBody2D

const GRAVITY = 20
const SPEED = 100
const JUMP = 500
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()

func _physics_process(delta):
	#motion.y += GRAVITY
	
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
	
	move_and_slide(motion,RESISTANCE)
	