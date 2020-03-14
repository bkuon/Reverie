extends Node

# Declare member variables here.
const POPUP_SCENE = preload("res://pausePopup.tscn")
const DIALOGUE_SCENE = preload("res://DialougeBox.tscn")

const WORLD_PATH = "res://world.tscn"

var popup = null
var canvas_layer = null
var dialogue = null
var dialogueStart=true

var unlocked = false
var coinCounter = 0
var inventory = []

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	
# global functions are currently:
# pause menu
# dialogue interface
# inventory storage

func _input(event):
	if Input.is_action_pressed("pause"):
		
		if popup==null:
			popup = POPUP_SCENE.instance() 
			canvas_layer.add_child(popup)
			popup.show()

		elif Input.is_action_pressed("pause") && popup!= null:
			popup.queue_free()
			popup=null
			
	if dialogueStart:
		if dialogue==null:
			dialogue = DIALOGUE_SCENE.instance() 
			canvas_layer.add_child(dialogue)
			dialogue.show()
			

func addToInventory(itemName):
	var itemNum = inventory.size()
	inventory.append(itemName)
