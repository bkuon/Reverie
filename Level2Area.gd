extends Area2D
#VERSION TO SEND
export(String, FILE, "*,tscn") var world_scene
var can_speak = true
var can_interact = false
var MCspeed
var newRandomVelocity
var timeout = 1

# Called when the node enters the scene tree for the first time.
func _ready():

	$Lock2Keypad/Sprite.hide()
	$hint.hide()
	$Level2Song.play()
	
	$crawlItemArea/crawlItem/crawlItemBox.is_disabled()
	$crawlItemArea/crawlItem/crawlItemSprite.hide()
	$TimerForWinning.set_wait_time(10)
	$TimerForWinning.start()
	$TimerForWinning.is_one_shot() == true
	#$Elevator/elevatorPNG2.hide()
	#$Elevator/Popup/ElevatorPopupMessage.hide()
	#$Level2Keypad/Sprite.hide()
	$Label2.hide()
	
	$TimerForSpeedChange.set_wait_time(1)
	$TimerForSpeedChange.start()
	$TimerForSpeedChange.is_one_shot() == true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#print($TimerForSpeedChange.get_time_left())
	
	if stepify($TimerForWinning.get_time_left(),0.1) == 0.1:
		#print("you won")
		$Lock2Keypad/Sprite.show()
		$Elevator/elevatorPNG2.hide()
		$Label2.show()
		$hint.show()
		
		$Level2Song.stop()
		$success_sound.play()
		
		$crawlItemArea/crawlItem/crawlItemBox.set_disabled(false)
		$crawlItemArea/crawlItem/crawlItemSprite.show()
		timeout = 0
		
	var bodies = get_overlapping_bodies()
	
	if stepify($TimerForSpeedChange.get_time_left(),0.1) == 0.5:
		MCspeed = get_parent().get_node("MC_Sprite").get("SPEED")
		#print("your new speed is ")
		#print(newRandomVelocity)
		newRandomVelocity = randi()%220+30
		MCspeed = get_parent().get_node("MC_Sprite").set("SPEED", newRandomVelocity)
		
	if timeout == 0:
		$TimerForSpeedChange.stop()
		MCspeed = get_parent().get_node("MC_Sprite").set("SPEED", 160)
	
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door") and can_interact:
			#go to next level
				get_tree().change_scene(world_scene)
				pass
	pass
