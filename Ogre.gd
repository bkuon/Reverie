extends Area2D

func _ready():
	$Response1.hide()
	$Response2.hide()
	$AnimatedSprite.play()

var event

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_Z:
			var bodies = get_overlapping_bodies()
			for b in bodies:
				if b.name == "MC_Sprite":
					var random = randi() % 100
					if random <= 49:
						$Response1.show()
						$audio1.play()
					else:
						$Response2.show()
						$audio2.play()


func _on_audio1_finished():
	$Response1.hide()

func _on_audio2_finished():
	$Response2.hide()
