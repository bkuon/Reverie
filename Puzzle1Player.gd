extends Area2D

var direction = Vector2()
var grid
var is_moving = false
var tween
var target_position = Vector2()
var blocks = []
var is_blocked:bool = false
export (NodePath) var rayU
export (NodePath) var rayD
export (NodePath) var rayL
export (NodePath) var rayR
var raycast

func _ready():
	grid = get_parent()
	tween = $Tween
	tween.connect_into(self)
	turn(Vector2(0,1))
	pass

func _physics_process(_delta):
	direction = Vector2()
		
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
	elif Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	if !is_moving and direction != Vector2():
		turn(direction)
		$PieceMovement.play()
		$PieceMovement.set_volume_db(-100)
		
		#if !raycast.is_colliding():
		target_position = get_position() + direction * grid.get_cell_size()
		tween.move_char(self, target_position)
		is_moving = true
		$PieceMovement.set_volume_db(-9)
	pass
	
func _on_tween_completed(_o, _k):
	is_moving = false
	pass
	
func turn(dir:Vector2):
	if dir.y < 0:
		raycast=get_node(rayU)
	elif dir.x < 0:
		raycast=get_node(rayL)
	elif dir.x > 0:
		raycast=get_node(rayR)
	else:
		raycast=get_node(rayD)
	pass


func _on_Puzzle1Button_hit():
	print("I Player touched the button")
	pass
