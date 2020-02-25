extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const POPUP_SCENE = preload("res://pausePopup.tscn")
const WORLD_PATH = "res://world.tscn"

var popup = null
var canvas_layer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)


func load_new_scene(new_scene_path):
     get_tree().change_scene(new_scene_path)
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		popup_closed()
		print("hold on")
		popup = POPUP_SCENE.instance()
		
		canvas_layer.add_child(popup)
		popup.popup()
		get_tree().paused = true
		
			
			
func popup_closed():
    get_tree().paused = false

    if popup != null:
        popup.queue_free()
        popup = null