extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = get_overlapping_bodies()
	for b in bodies:
		if b.name == "MC_Sprite":
			print("spike touched mc")
			
			get_tree().change_scene("res://Level2.tscn")
