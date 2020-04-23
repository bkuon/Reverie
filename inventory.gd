extends Control

onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("TextureRect").set_visible(false)
	pass

func _physics_process(delta):
	if Globals.inventoryIsOpen:
		populate()
		#get_node("TextureRect2").set_visible(false)
		get_node("TextureRect").set_visible(true)
	if !Globals.inventoryIsOpen:
		get_node("TextureRect").set_visible(false)
		#get_node("TextureRect2").set_visible(true)
	if Input.is_action_pressed("merge"):
		merge()


func populate():
	var inventory = globals.inventory
	var items = inventory.size()
	if items > 0:
		var i = 1
		for slot in inventory:
			var icon = "res://images/Items/" + str(slot) + ".png"
			get_node("TextureRect/InventorySlots/" + str(i) +"/LootButton").set_normal_texture(load(icon))
			i = i+1

func merge():
	var inventory = globals.inventory
	var itemSearch = globals.mergeableItems
	var piece1 = null
	var piece2 = null
	var i = 0
	for slot in inventory:
		if slot == itemSearch[0]:
			piece1 = i
		if slot == itemSearch[1]:
			piece2 = i
		i = i + 1
	if piece1 != null && piece2 != null:
		globals.inventory.erase(globals.inventory[piece2])
		globals.inventory.erase(globals.inventory[piece1])
		get_node("TextureRect/InventorySlots/" + str(piece1+1) + "/LootButton").set_normal_texture(load(""))
		get_node("TextureRect/InventorySlots/" + str(piece2+1) + "/LootButton").set_normal_texture(load(""))
		globals.addToInventory(itemSearch[2])
		populate()

