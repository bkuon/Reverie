extends Node

# Declare member variables here.
const POPUP_SCENE = preload("res://pausePopup.tscn")
const WORLD_PATH = "res://world.tscn"

var popup = null
var canvas_layer = null
var unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
    canvas_layer = CanvasLayer.new()
    add_child(canvas_layer)
    
func _input(event):
	if Input.is_action_pressed("pause"):
		
		if popup==null:
			popup = POPUP_SCENE.instance() 
			canvas_layer.add_child(popup)
			popup.show()

		elif Input.is_action_pressed("pause") && popup!= null:
			popup.queue_free()
			popup=null

