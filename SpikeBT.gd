extends RigidBody2D

export var min_speed = 150
export var max_speed = 250
var velocity

func _integrate_forces(state):
    var dt = state.get_step()
    var gravity = state.get_total_gravity() # The default gravity, you can use your own.
    var velocity = state.get_linear_velocity()
	
	#var direction = Vector2()* gravity.length()

func ready():
	set_use_custom_integrator(true)
	
	velocity = set_linear_velocity(Vector2(0,-5))


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


func _on_SpikeBT_body_entered(body):
	var bodies = get_colliding_bodies()
	#if body.name == "MC_Sprite":
	for body in bodies:
		if body.get_name() == "MC_Sprite":
			print("hit")
			body.spike_kill()
		#if body.get_name() =="BrandonEditTileMap":
			#$Sprite.hide()
#		#get_tree().change_scene("Level2.tscn")

