extends RigidBody2D

var picked = false

var can_speak = true
var can_interact = true
onready var globals = get_node("/root/Globals")

var itemInfo

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z and can_interact:
			var inv_items = get_tree().get_nodes_in_group("inventoryItem")
			for inv in inv_items:
				var bodies = inv.get_overlapping_bodies()
				for b in bodies:
					if b.name == "MC_Sprite":
						print(inv.name)
						globals.addToInventory(inv.name) #Add item to inventory using image name
						remove_child(inv) # Remove that inventory item from view


