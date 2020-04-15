extends KinematicBody2D

const GRAVITY = 10
const SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

var random = 0
var random2 = 0 

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	random = randi()%10 + 1
	

	if random%2 == 0:
		velocity.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
	
		$AnimatedSprite.play("idle")
	
		velocity.y += GRAVITY
	
		velocity = move_and_slide(velocity, FLOOR)
	
		if is_on_wall():
			direction = direction * -1
			
		random = randi()%10 + 1
	else:
		velocity.x = 0
		var t = Timer.new()
		t.set_wait_time(5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(get_tree().create_timer(50.0), "timeout")
		
		t.queue_free()
		
		direction = direction * -1
		random = randi()%10 + 1


