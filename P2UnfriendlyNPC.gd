extends KinematicBody2D

export(String, FILE, "world.tscn") var world_scene

const GRAVITY = 10
const MIN_SPEED = 10
const MAX_SPEED = 20

const FLOOR = Vector2(0,-1)

var velocity = Vector2()

var collider = null



#dealing with timing of character
var direction = 1
var timer = null
var timer_reset = 5

#dealing with movement of character
var random_number = 0

func get_random_number():
	randomize()
	return randi()%4

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(5)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _on_timeout_complete():
	random_number = get_random_number()

func _on_Enemy_body_enter(body):
	if body.get_name() == "MC_Sprite":
		body.kill()
		print("killed")


func _on_hitbox_collision(value):
	collider = value.get_parent()
	if($CollisionShape2D.is_colliding()):         
		var entity = $CollisionShape2D.get_collider()
	print("entity")


func _physics_process(delta):
	
	_ready()
	
	timer.start()
	

	
	if random_number == 0:
		velocity.x = 0
	if random_number == 1:
		velocity.x = MIN_SPEED * direction 
	if random_number == 2:
		velocity.x = MIN_SPEED * -direction 
	if random_number == 3:
		velocity.x = MAX_SPEED * direction
	
	velocity.x = MAX_SPEED * -direction
	
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

		
	$AnimatedSprite.play("default")
	
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)
	

	
	if is_on_wall():
		direction = direction * -1 
		$RayCast2D.position.x *= -1
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		
		
		
	#if $RayCast2D.is_colliding() == false:
	#	direction = direction * -1
	#	$RayCast2D.position.x *= -1
		
	
	pass
	
