extends RigidBody2D

export var min_speed = 150
export var max_speed = 250
var velocity
var state

func ready():
	velocity = set_linear_velocity(Vector2(0,80))


func _physics_process(delta):
	velocity = get_linear_velocity()
	#print(velocity.y)
	if velocity.y <= 0 or (velocity.y <= 0 and velocity.y >= 1):
		if $Visibility.is_on_screen():
			$Sprite.hide()
	
	#if state == "touched":
	#	"the spike touched something"
	#	get_tree().change_scene("res://Level2.tscn")
	




	


