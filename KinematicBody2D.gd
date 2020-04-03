extends KinematicBody2D

#Jump Physics [Brandon Edit 3/13]
const UP = Vector2(0, -1) 
const JUMP_HEIGHT = -200
#End Jump Variable

#Run Physics [Brandon Edit 3/13]
const ACCELERATION = 100
const MAX_SPEED = 300
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
		
	if MC_Globals.canJump:
		$AbilityLayer/jumpIcon.visible=true
	if MC_Globals.canRun:
		$AbilityLayer/runIcon.visible=true
	if MC_Globals.canCrawl:
		$AbilityLayer/crawlIcon.visible=true
	
	motion.y += GRAVITY
	#Add Variable Friction
	var friction = false

	$AbilityLayer/jumpIcon.play("default")
	$AbilityLayer/runIcon.play("default")
	$AbilityLayer/crawlIcon.play("default")
	
	if can_move:
		if Input.is_action_pressed("ui_right"):
			motion.x= SPEED
			$Sprite.flip_h = false
			$Sprite.play("walk")
			
		elif Input.is_action_pressed("ui_left"):
			motion.x = -SPEED
			$Sprite.flip_h = true
			$Sprite.play("walk")
			
		else:
			motion.x=0
			$Sprite.play("idle")
	#Run Ability alongside jump utilities implemented here.
	if Input.is_action_pressed("ui_right") and Input.is_key_pressed(KEY_V) and MC_Globals.canRun:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("walk")
		MC_Globals.isRunning=true
		$AbilityLayer/runIcon.play("active")
		
	if Input.is_action_just_pressed("interact"):
		if obj and (obj_name == "NPC" or obj_name == 'Enemy Puzzle1') and obj.can_speak:
			can_move = false
			#$sprite.play("idle")
			get_node("../DialogueParser").init_dialogue(obj_name)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up") && MC_Globals.canJump:
			motion.y = JUMP_HEIGHT
			MC_Globals.isJumping=true
				
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0: 
			$Sprite.play("Jump")
			$AbilityLayer/jumpIcon.play("active")
		else:
			$Sprite.play("Fall")
			MC_Globals.isJumping=false
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
			
					
	#Implement Duck Function
	if Input.is_action_pressed("ui_down") and MC_Globals.canCrawl:
		MC_Globals.isCrawling=true
		$Sprite.play("duck")
		$AbilityLayer/crawlIcon.play("active")
		motion.x = 0
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right") and MC_Globals.canCrawl:
		motion.x = DUCK_SPEED
		MC_Globals.isCrawling=true
		$Sprite.play("crawl")
		$AbilityLayer/crawlIcon.play("active")
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left") and MC_Globals.canCrawl:
		$Sprite.flip_h = true
		$Sprite.play("crawl")
		MC_Globals.isCrawling=true
		$AbilityLayer/crawlIcon.play("active")
		motion.x = -DUCK_SPEED
	#End Duck Function

	motion = move_and_slide(motion, UP)
	
	pass
	
# =======
	
#signals when player is touching object. 
#gets object name for DialogueParser
func _on_Area2D_area_entered(area):
	obj_name = area.name
	obj = area.get_parent()
	if area.name == "Enemy Puzzle1":
		obj = area
	
	
	
func _on_Area2D_area_exited(area):
	obj = ""
	
# custom signal says that the item has been checked for/ or has finished dialogue
func _on_DialogueParser_done_talking():
	obj.can_interact = true
	obj.can_speak = false
	can_move = true

func teleport_to(target_pos):
	position = target_pos


func _on_Sprite_animation_finished():
	 MC_Globals.victory=false

#end dialogue encounter but allows player to approach them again
func _on_DialogueParser_end_encounter():
	can_move = true
