extends KinematicBody2D

var motion = Vector2()
const RESISTANCE = Vector2(0,0)

func _physics_process(delta):
	#motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_up"):
		#motion.y = SPEED
		print("up")

	elif Input.is_action_pressed("ui_down"):
		print("down")
		#motion.y = -SPEED

	move_and_slide(motion,RESISTANCE)