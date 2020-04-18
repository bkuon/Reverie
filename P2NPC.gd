extends Area2D

const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1

const GRAVITY = 10

const MIN_SPEED = 10
const MAX_SPEED = 25

var velocity = Vector2()

var direction = Vector2(DIRECTION_RIGHT,1)

func set_direction(hor_direction):
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT
	var hor_dir_mod = hor_direction / abs(hor_direction)
	apply_scale(Vector2(hor_dir_mod * direction.x, 1))
	direction = Vector2(hor_dir_mod, direction.y)

var random_number = 0

func get_random_number():
	randomize()
	return randi()%4
	
func _on_Enemy_body_entered(body):
	if body.get_name() == "MC_Sprite":
		body.kill()

func _ready():
	pass # Replace with function body.

func _process(delta):
	
	velocity.y += GRAVITY
	
	random_number = get_random_number()
	
	if random_number == 0:
		velocity.x = 0
	if random_number == 1:
		velocity.x = MIN_SPEED 
	if random_number == 2:
		velocity.x = MIN_SPEED * -1
	if random_number == 3:
		velocity.x = MAX_SPEED
	if random_number == 4:
		velocity.x = MAX_SPEED * -1
	
	


