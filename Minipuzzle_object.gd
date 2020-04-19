
extends Area2D


export(String, FILE, "*,tscn") var world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door"):
			#go to next level
				get_tree().change_scene(world_scene)
				pass
