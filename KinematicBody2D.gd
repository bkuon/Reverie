extends KinematicBody2D

const GRAVITY = 20
const SPEED = 100
const JUMP = 500
const RESISTANCE = Vector2(0,-1)

var motion = Vector2()
var obj_name: String
var obj = null
var can_move = true

func _physics_process(delta):
	#motion.y += GRAVITY
	if can_move:
		if Input.is_action_pressed("ui_right"):
			motion.x= SPEED
			$sprite.flip_h = false
			$sprite.play("walk")
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$sprite.flip_h = true
			$sprite.play("walk")
			
		elif Input.is_action_just_pressed("ui_up"):
			print("jump not added yet")
			
			
		else:
			motion.x=0
			$sprite.play("idle")
	
		if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
			motion.x=0
			$sprite.play("idle")
		
			
		motion = move_and_slide(motion,RESISTANCE)
		
	if Input.is_action_just_pressed("interact"):
		if obj and obj_name != "" and obj_name != "Door" and obj.can_speak:
			can_move = false
			#$sprite.play("idle")
			get_node("../DialogueParser").init_dialogue(obj_name)
	

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
