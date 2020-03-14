extends Control

onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextureRect").set_visible(false)
	

func _physics_process(delta):
	if Input.is_action_pressed("ui_inventory"):
		populate()
		get_node("TextureRect2").set_visible(false)
		get_node("TextureRect").set_visible(true)
	if Input.is_action_pressed("ui_cancel"):
		get_node("TextureRect").set_visible(false)
		get_node("TextureRect2").set_visible(true)


func populate():
	var inventory = globals.inventory
	var items = inventory.size()
	if items > 0:
		var i = 1
		for slot in inventory:
			var icon = "res://images/Items/" + str(slot) + ".png"
			get_node("TextureRect/InventorySlots/" + str(i) +"/LootButton").set_normal_texture(load(icon))
			i = i+1
