extends Area2D
signal hit
var currentAnimation
var state
var light

var MPB1

func _ready():
	$Sprite.play("off")
	pass # Replace with function body.

func _physics_process(delta):
	currentAnimation = $Sprite.get_animation()
	if state == "touched" and Input.is_key_pressed(KEY_Z) and currentAnimation == "off":
		$Sprite.play("on")
		$on_sound.play()
		light = "on"

		
	if state == "touched" and Input.is_key_pressed(KEY_A) and currentAnimation == "on":
		$Sprite.play("off")
		$off_sound.play()
		light = "off"
	
	pass

func _on_MinipuzzleButton_area_entered(area):
	#if Input.is_key_pressed(KEY_Z):
	print("I button have been touched")
	emit_signal("hit")
	state = "touched"


func _on_MinipuzzleButton_area_exited(area):
	state = "untouched"
	pass # Replace with function body.
