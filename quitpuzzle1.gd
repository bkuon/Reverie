extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true) 
	##This may or may not be required for inputs to work.

func _input(ev):
	if Input.is_key_pressed(KEY_Q):
		get_tree().change_scene("res://Level1.tscn")

