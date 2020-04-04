extends KinematicBody2D

const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	velocity.x = -SPEED
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	
