extends Area2D

export(String, FILE, "*,tscn") var world_scene
var can_speak = true
var can_interact = false
var MCspeed
var newRandomVelocity

# Called when the node enters the scene tree for the first time.
func _ready():
	$jumpItemArea/jumpItem/jumpItemBox.is_disabled()
	$jumpItemArea/jumpItem/jumpItemSprite.hide()
	$TimerForWinning.set_wait_time(5)
	$TimerForWinning.start()
	$TimerForWinning.is_one_shot() == true
	$Elevator/elevatorPNG2.hide()
	$Elevator/Popup/ElevatorPopupMessage.hide()
	$Level2Keypad/Sprite.hide()
	$Label2.hide()
	
	$TimerForSpeedChange.set_wait_time(1)
	$TimerForSpeedChange.start()
	$TimerForSpeedChange.is_one_shot() == true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#print($TimerForSpeedChange.get_time_left())
	
	if $TimerForWinning.get_time_left() < 0.1:
		#print("time's up")
		$Elevator/elevatorPNG2.show()
		$Elevator/Popup/ElevatorPopupMessage.show()
		$Level2Keypad/Sprite.show()
		$Label2.show()
	
	if stepify($TimerForWinning.get_time_left(),0.1) == 0.1:
		#print("you won")
		$Label2.show()
		#$Label1.hide()
		
		$jumpItemArea/jumpItem/jumpItemBox.set_disabled(false)
		$jumpItemArea/jumpItem/jumpItemSprite.show()
			
		
	var bodies = get_overlapping_bodies()
	
	if stepify($TimerForSpeedChange.get_time_left(),0.1) == 0.5:
		MCspeed = get_parent().get_node("MC_Sprite").get("SPEED")
		#print("your new speed is ")
		#print(newRandomVelocity)
		newRandomVelocity = randi()%220+30
		MCspeed = get_parent().get_node("MC_Sprite").set("SPEED", newRandomVelocity)
		
		
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door") and can_interact:
			#go to next level
				get_tree().change_scene(world_scene)
				pass
	pass
