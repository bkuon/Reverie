extends RigidBody2D

var picked = false


func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z:
			var bodies = $bluekey.get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					# add object to inventory here
					queue_free()
			
			

