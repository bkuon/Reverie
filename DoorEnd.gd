#Door.gd
extends Area2D
export(String, FILE, "*,tscn") var end_scene
var state

func _physics_process(delta):
	if state == "touched" or Input.is_key_pressed(KEY_Z):
    	var bodies = get_overlapping_bodies()
    	for body in bodies:
        	if body.name == "MC_Sprite":
            	if Input.is_action_just_pressed("enter_door"):
            	#go to next level
                get_tree().change_scene(end_scene)
                pass

func _on_Door_area_entered(area):
	state = "touched"

