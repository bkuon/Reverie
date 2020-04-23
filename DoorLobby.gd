#Door.gd

extends Area2D



export(String, FILE, "*,tscn") var world_scene
export(NodePath) var teleport_target=null

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door"):
			#go to next level
				get_tree().change_scene(world_scene)
				get_tree().call_group("MC_Sprite","teleport_to",get_node(teleport_target).position)
				pass
