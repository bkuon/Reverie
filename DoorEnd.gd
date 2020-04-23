#Door.gd
extends Area2D
export(String, FILE, "*,tscn") var end_scene
var state

func _physics_process(delta):
	if state == "touched" and Input.is_key_pressed(KEY_Z):
		get_tree().change_scene(end_scene)

func _on_Door_area_entered(area):
	state = "touched"

