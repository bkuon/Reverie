extends Area2D
export(String, FILE, "*,tscn") var lock2keypad
var state

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == "touched" and Input.is_key_pressed(KEY_Z):
		get_tree().change_scene(lock2keypad)
	pass


func _on_Lock2Keypad_area_entered(area):
	state = "touched"
	print("lock2 touched")
	pass # Replace with function body.
