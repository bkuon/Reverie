extends Area2D

const GRAVITY = 10
const MIN_SPEED = 10
const MAX_SPEED = 20


func _on_Enemy_body_entered(body):
	if body.get_name() == "MC_Sprite":
		body.kill()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

