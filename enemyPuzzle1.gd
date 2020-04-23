extends Area2D

export(String, FILE, "*,tscn") var world_scene
var can_speak = true
var can_interact = false

# Some Luna Nonsense
const PUZZLE = preload("res://Puzzle1.tscn")
#var puzzle1 = null
#var canvas_layer = null

func _ready():
#	canvas_layer = CanvasLayer.new()
#	add_child(canvas_layer)
	pass
	
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	if can_interact: 
		get_node("Label").set_visible(true)
	else:
		get_node("Label").set_visible(false)
	for body in bodies:
		if body.name == "MC_Sprite":
			if Input.is_action_just_pressed("enter_door") and Globals.response == "I'm ready":
			#go to next level
			#if puzzle1==null:
			#	puzzle1 = PUZZLE.instance() 
			#	canvas_layer.add_child(puzzle1)
			#	puzzle1.show()
				get_tree().change_scene(world_scene)
				pass
		
