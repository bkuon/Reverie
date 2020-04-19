extends Area2D

const MIN_SPEED = 10
const MAX_SPEED = 20

const GRAVITY = 10

var velocity = Vector2()

func _ready():
	pass

func get_random_number():
	randomize()
	return randi()%4

func _physics_process(delta):
	
	
	velocity.x += MIN_SPEED
	
	
	velocity = velocity.normalized() * MIN_SPEED
	
	position += velocity * delta
	



func _on_P2NPC_body_entered(body):
	
	if body.get_name() == "MC_Sprite":
		print("hit")
		body.spike_kill()
