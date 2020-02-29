extends StaticBody2D

var pressed = false
#onready var door = get_tree().get_root().get_node("World/doorObject/doorObj")
onready var globals = get_node("/root/Globals")

var can_speak = false
var can_interact = true

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z:
			var bodies = $table_button.get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					$table_button/button.play("pressIn")
					if pressed == false:
						globals.unlocked = true
						pressed == true

