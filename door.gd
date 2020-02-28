extends Node

var open = false
var dooropen = preload("res://images/Items/dooropen.png")
var doorclosed = preload("res://images/Items/doorclosed.png")

onready var door = get_node("doorObj/doorSprite")

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z:
			var bodies = $doorObj.get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					open = !open
					if open == true:
						door.texture = dooropen
						$doorObj.collision_layer = 2 #change collision layer so it no longer colides
					elif open == false:
						door.texture = doorclosed
						$doorObj.collision_layer = 1 #change collision layer so it collides
			
			


func _on_door_body_entered(body):
	if body.name == "MC_Sprite":
		print("Collision with door!")
