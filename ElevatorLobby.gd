#elevator.gd

extends Area2D

export(String, FILE, "*,tscn") var elevator_L
export(String, FILE, "*,tscn") var elevator_1

var player_in_door = false

func _ready():
	$Popup.hide()

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite" :
			if Input.is_action_just_pressed("enter_lobby"):
				#go to next level
					get_tree().change_scene(elevator_L)
					
			if Input.is_action_just_pressed("enter_level1"):
				#go to next level
					get_tree().change_scene(elevator_1)
					

func _on_Elevator_body_entered(body):
	if  body.name == "MC_Sprite" :
		$Popup.show()
		player_in_door = true
			
func _on_Elevator_body_exited(body):
	if body.name == "MC_Sprite" :
		$Popup.hide()
		player_in_door = false
#Input.is_action_just_pressed("enter_elevator") and
