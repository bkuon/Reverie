extends RigidBody2D

var picked = false

var can_speak = true
var can_interact = false


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z and can_interact:
			var bodies = $bluekey.get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					# add object to inventory here
					print("Blue Key added to Inventory.")
					queue_free()
			
			

