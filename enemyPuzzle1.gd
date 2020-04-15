

extends Area2D
export(String, FILE, "*,tscn") var world_scene
var can_speak = true
var can_interact = false

	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	if can_interact: 
		get_node("Label").set_visible(true)
	else:
		get_node("Label").set_visible(false)
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door") and can_interact:
			#go to next level
				get_tree().change_scene(world_scene)
				pass
		
