extends KinematicBody2D

#var door

const GRAVITY = 10
const SPEED = 100
const JUMP = 500
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()

#func _ready():
#	door = get_parent().get_node("Door")

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
	

#func _on_Door_area_entered(area):
#	print("player entered the area")
#	door.cango = true
#	pass # replace with function body
	
#func _on_Door_area_exited(area):
#	door.cango = false
#	print("Player exited the area")
#	pass # Replace with function body

