#Door.gd
extends Area2D
export(String, FILE, "*,tscn") var backtolevel3
var state




func _physics_process(delta):
	if state == "touched" and Input.is_key_pressed(KEY_Z):
		get_tree().change_scene(backtolevel3)
	
	pass


func _on_Door_area_entered(area):
	state = "touched"
	pass # Replace with function body.
