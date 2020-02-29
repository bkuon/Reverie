extends Node

var open = false
onready var globals = get_node("/root/Globals")
var dooropen = preload("res://images/Items/dooropen.png")
var doorclosed = preload("res://images/Items/doorclosed.png")

var can_speak = false
var can_interact = true

onready var door = get_node("doorObj/doorSprite")

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z and can_interact:
			var unlocked = globals.unlocked
			var bodies = $doorObj.get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					if unlocked == true:
						open = !open
						if open == true:
							door.texture = dooropen
							$CollisionShape2D2.disabled = true #change collision layer so it no longer colides
						elif open == false:
							door.texture = doorclosed
							$CollisionShape2D2.disabled = false #change collision layer so it collides


#func _on_door_body_entered(body):
	#if body.name == "MC_Sprite":
		#print("Collision with door!")
