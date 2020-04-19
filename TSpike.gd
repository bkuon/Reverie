extends RigidBody2D

export var min_speed = 150
export var max_speed = 250
var velocity

func ready():
	velocity = set_linear_velocity(Vector2(0,80))


func _physics_process(delta):
	#var bodies = get_colliding_bodies()
	velocity = get_linear_velocity()
	#print(velocity.y)  
	
	if velocity.y <= 0 or (velocity.y <= 0 and velocity.y >= 1):
		if $Visibility.is_on_screen():
			queue_free()
			#$Sprite.hide()
			
	#for body in bodies:
	#	if body.get_name() == "MC_Sprite":
	#		print("hit")


func _on_Spike_body_entered(body):
	var bodies = get_colliding_bodies()
	#if body.name == "MC_Sprite":
	for body in bodies:
		if body.get_name() == "MC_Sprite":
			print("hit")
			body.spike_kill()
		#if body.get_name() =="BrandonEditTileMap":
			#$Sprite.hide()
#		#get_tree().change_scene("Level2.tscn")


