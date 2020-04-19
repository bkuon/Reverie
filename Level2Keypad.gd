extends Area2D
signal hit
var currentAnimation
var state
var light

var MPB1

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if state == "touched" and Input.is_key_pressed(KEY_Z):
		get_tree().change_scene("res://Game.tscn")
	pass



func _on_Level2Keypad_area_entered(area):
	#if Input.is_key_pressed(KEY_Z):
	print("I button have been touched")
	emit_signal("hit")
	state = "touched"
