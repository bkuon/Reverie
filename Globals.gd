extends Node

# Declare member variables here.
const POPUP_SCENE = preload("res://pausePopup.tscn")
const DIALOGUE_SCENE = preload("res://DialougeBox.tscn")
const CHOICE_SCENE = preload("res://choicePopup.tscn")



const WORLD_PATH = "res://world.tscn"

var popup = null
var canvas_layer = null

#for dialogue events
var dialogue = null
var dialogueStart=false
var words
var choices
var response
var decided = false
var display_choice = false
var char_name
var char_portrait

var unlocked = false
var coinCounter = 0
var inventory = []
var inventoryIsOpen=false
var mergeableItems = ["greenupper", "greenlower", "greenkey"]
var followerImage

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
			
	if display_choice:
		if popup == null:
			popup = CHOICE_SCENE.instance()
			canvas_layer.add_child(popup)
			popup.show()
			
	if dialogueStart:
		if dialogue==null:
			find_portrait()
			dialogue = DIALOGUE_SCENE.instance() 
			canvas_layer.add_child(dialogue)
			dialogue.show()
			

func addToInventory(itemName):
	var itemNum = inventory.size()
	inventory.append(itemName)
	
func setCompanion(link):
	followerImage = link


func find_portrait():
	if char_name == null: pass
	else:
		if char_name == "Enemy Puzzle1":
			char_portrait = preload("res://enemy_puzzle1.png")
		elif char_name == "NPC":
			char_portrait = preload("res://Images/NPC/DolphinNPC/DolphinNPC.png")
		else:
			char_portrait = preload("res://icon.png")
